


 ##Creating objects in R

### Vectors and data types
## ## We’ve seen that atomic vectors can be of type character, numeric, integer, and
## ## logical. But what happens if we try to mix these types in a single
## ## vector?
## 
## ## What will happen in each of these examples? (hint: use `class()` to
## ## check the data type of your object)
## num_char <- c(1, 2, 3, 'a')
## 
## num_logical <- c(1, 2, 3, TRUE)
## 
## char_logical <- c('a', 'b', 'c', TRUE)
## 
## tricky <- c(1, 2, 3, '4')

#> num_char <- c(1, 2, 3, 'a')
#> class(num_char)
#[1] "character"
#> num_logical <- c(1, 2, 3, TRUE)
#> class(num_logical)
#[1] "numeric"
#> class(num_logical)
#[1] "numeric"
#> char_logical <- c('a', 'b', 'c', TRUE)
#> class(char_logical)
#[1] "character"
#> tricky <- c(1, 2, 3, '4')
#> class(tricky)
#[1] "character"
> 
## 
## ## Why do you think it happens?
# Is expressed differently in each situation:
# The first one have a character  and it seems is detected by the program which assume the others are also a character.
## 
## ## Can you draw a diagram that represents the hierarchy of the data
## ## types?
# * Can you figure out why `"four" > "five"` returns `TRUE`?


### Presentation of the survey data
## download.file("https://ndownloader.figshare.com/files/2292169",
##  "data/portal_data_joined.csv")

## Challenge
## Based on the output of `str(surveys)`, can you answer the following questions?
## * What is the class of the object `surveys`? data frame
## * How many rows and how many columns are in this object? 13 columns and 34786
## * How many species have been recorded during these surveys? 48

### Factors
sex <- factor(c("male", "female", "female", "male"))
sex

#which are the levels
levels(sex)

#quantity of levels
nlevels(sex)

food <- factor(c("low", "high", "medium", "high", "low", "medium", "high"))
food
levels(food)

#redefine the levels

food <- factor(food, levels=c("low", "medium", "high"))


levels(food)
min(food) ## doesn't work
food <- factor(food, levels=c("low", "medium", "high"), ordered=TRUE)


#This is used for analysis  of data, ordered=TRUE 
levels(food)
min(food)
##now it works!
f <- factor(c(1, 5, 10, 2))
as.numeric(f)               ## wrong! and there is no warning...we gotta be careful
as.numeric(as.character(f)) ## works...
as.numeric(levels(f))[f]    ## The recommended way.
## Challenge
##
## * In which order are the treatments listed?
##
## * How can you recreate this plot with "control" listed
## last instead of first?
exprmt <- factor(c("treat1", "treat2", "treat1", "treat3", "treat1", "control",
                   "treat1", "treat2", "treat3"))
table(exprmt)
barplot(table(exprmt))

levels(exprmt)

exprmt <- factor(exprmt, levels=c("treat1", "treat2", "treat3", "control"))
levels(exprmt)
barplot(table(exprmt))



## The data.frame class
## Compare the output of these examples, and compare the difference between when
## the data are being read as `character`, and when they are being read as
## `factor`.
example_data <- data.frame(animal=c("dog", "cat", "sea cucumber", "sea urchin"),
                           feel=c("furry", "furry", "squishy", "spiny"),
                           weight=c(45, 8, 1.1, 0.8))

##
str(example_data)

#String as factors what it does is that change them as character
example_data <- data.frame(animal=c("dog", "cat", "sea cucumber", "sea urchin"),
                           feel=c("furry", "furry", "squishy", "spiny"),
                           weight=c(45, 8, 1.1, 0.8), stringsAsFactors=FALSE)
str(example_data)


## ## Challenge
## ##  There are a few mistakes in this hand crafted `data.frame`,
## ##  can you spot and fix them? Don't hesitate to experiment!
## author_book <- data.frame(author_first=c("Charles", "Ernst", "Theodosius"),
##                               author_last=c(Darwin, Mayr, Dobzhansky),
##                               year=c(1942, 1970))

author_book <- data.frame(author_first=c("Charles", "Ernst", "Theodosius"),
                                                      author_last=c("Darwin", "Mayr", "Dobzhansky"),
                                                      year=c(NA, 1942, 1970))

#there's a year missing 
## ## Challenge:
## ##   Can you predict the class for each of the columns in the following
## ##   example?
## ##   Check your guesses using `str(country_climate)`:
## ##   * Are they what you expected? Why? why not?
## ##   * What would have been different if we had added `stringsAsFactors = FALSE`
## ##     to this call?
## ##   * What would you need to change to ensure that each column had the
## ##     accurate data type?
## country_climate <- data.frame(country=c("Canada", "Panama", "South Africa", "Australia"),
##                                climate=c("cold", "hot", "temperate", "hot/temperate"),
##                                temperature=c(10, 30, 18, "15"),
##                                northern_hemisphere=c(TRUE, TRUE, FALSE, "FALSE"),
##                                has_kangaroo=c(FALSE, FALSE, FALSE, 1))

country_climate <- data.frame(country=c("Canada", "Panama", "South Africa", "Australia"),
                                                           climate=c("cold", "hot", "temperate", "hot/temperate"),
                                                            temperature=c(10, 30, 18, 15),
                                                          northern_hemisphere=c(TRUE, TRUE, FALSE, FALSE),
                                                          has_kangaroo=c(FALSE, FALSE, FALSE, TRUE),stringsAsFactors=FALSE))
)

country_climate

country_climate <- data.frame(country=c("Canada", "Panama", "South Africa", "Australia"),
                              climate=c("cold", "hot", "temperate", "hot/temperate"),
                              temperature=c(10, 30, 18, 15),
                              northern_hemisphere=c(TRUE, TRUE, FALSE, FALSE),
                              has_kangaroo=c(FALSE, FALSE, FALSE, TRUE))


## Sequences and Subsetting data frames

### 1. The function `nrow()` on a `data.frame` returns the number of
### rows. Use it, in conjuction with `seq()` to create a new
### `data.frame` called `surveys_by_10` that includes every 10th row
### of the survey data frame starting at row 10 (10, 20, 30, ...)
###
### 2. Create a data.frame containing only the observation from 1999 of the -->
### surveys dataset.



#June 1,2016


##Aggregating and analyzing data with dplyr


surveys=read.csv(file="data/portal_data_joined.csv")

# For opening the used of a previously installed package. Look in the library for the dplyr package
library(dplyr)


# select some columns

select(surveys,plot_id,species_id,weight)



#filter some rows


filter(surveys,year == 1995)


year95=filter(surveys,year == 1995)

View(year95)


#pipes

##%>% pass the data of the filter and what you select is what is shown

surveys %>% 
  filter(year==1995) %>%
  select (species_id,sex,weight)

##

surveys %>% 
  filter(year==1995) %>%
  select (species_id,sex,weight)%>%
 head()

##Challenge

###Using pipes,subset the data to include individuals weighting more than 15 g collected before 1993, and show only 
##the columns years, sex and weight.


surveys %>% 
  filter(weight>15, year<1993) %>%
    select (year,sex,weight)


##

surveys %>% 
  filter(weight>15, year<1993) %>%
  select (year,sex,weight)
%>%arrange (year)

##information about data frame
 

str(surveys)

dim(surveys)
nrow(surveys)
ncol(surveys)
names(surveys)


##

w151993=surveys %>% 
  filter(weight>15, year<1993) %>%
  select (year,sex,weight)

nrow (w151993)


surveys %>% 
  filter(weight>15, year<1993) %>%
  select (year,sex,weight)
nrow

nrow(select(filter(weight>15, year<1993) %>%
              select (year,sex,weight))
     

     
##Mutate     

surveys %>%
  mutate(weight_kg=weight/1000)


surveys %>%
  mutate(weight_kg=weight/1000) %>%
  tail

surveys %>%
  filter(!is.na(weight)) %>%
  mutate(weight_kg=weight/1000)


##Challenge

#Create a new data frame from the survey data set that meet the following criteria:
#-it contains only the species_id column and a new column called hindfoot_half thats is the half the value of the 
#hindfold_length column.
#-there is no missing values in the hindfoot_half column
#-all the values are below 30

surveys %>%
    mutate(hindfoot_half=hindfoot_length /2) %>%  
  filter(!is.na(hindfoot_half<30)) %>%
  select (species_id,hindfoot_half)

  

##
hinhalf= surveys %>%
  mutate(hindfoot_half=hindfoot_length /2) %>%  
  filter(!is.na(hindfoot_length),hindfoot_half<30) %>%
  select (species_id,hindfoot_half)


##

write.csv(hinhalf,file="hinhalf.csv",row.names=FALSE)



##Split-apply-combine


surveys %>%
  group_by(sex) %>%
  tally


##

surveys %>%
  group_by(sex) %>%
summarize(mean_weight=mean(weight,na.rm=TRUE))

#
surveys %>%
group_by(sex,species_id) %>%
  summarize(mean_weight=mean(weight,na.rm=TRUE))

#NaN=not a number

surveys %>%
  group_by(sex,species_id) %>%
  summarize(mean_weight=mean(weight,na.rm=TRUE)) %>%
  filter(!is.nan(mean_weight))




surveys %>%
  group_by(sex,species_id) %>%
  summarize(mean_weight=mean(weight,na.rm=TRUE)) %>%
  filter(!is.nan(mean_weight), sex!="")


####Challenges

#1. How many times each 'plot_type' has been surveyed?


surveys %>%
  group_by(plot_type) %>%
  tally


#2.Use a group_by and summarize to find the mean, min, maximum for the hindfoot_length of each species.


surveys %>%
  group_by(species_id) %>%
  summarize(hindfoot_mean=mean(hindfoot_length,na.rm=TRUE)) %>%
  filter(!is.nan(hindfoot_mean))
  
  
  surveys %>%
    group_by(species_id) %>%
    summarize(hindfoot_min=min(hindfoot_length,na.rm=TRUE)) %>%
                filter(!is.na(hindfoot_min))
              
surveys %>%
group_by(species_id) %>%
                summarize(hindfoot_max=max(hindfoot_length,na.rm=TRUE)) %>%
                            filter(!is.na(hindfoot_max))   

#Correct one

surveys %>%
  group_by(species_id) %>%
  summarize(hindfoot_mean=mean(hindfoot_length,na.rm=TRUE),
            hindfoot_min=min(hindfoot_length,na.rm=TRUE),
            hindfoot_max=max(hindfoot_length,na.rm=TRUE)) %>%
  filter(!is.nan(hindfoot_mean),!is.na(hindfoot_min),!is.na(hindfoot_max))



#other way


surveys
filter(!is.nan(hindfoot_length)) %>%
  group_by(species_id) %>%
  summarize((hindfoot_mean=mean(hindfoot_length,na.rm=TRUE),
             hindfoot_min=min(hindfoot_length,na.rm=TRUE),
             hindfoot_max=max(hindfoot_length,na.rm=TRUE))
            
#3. [optional] What was the heaviest animal measured in each year (return the columns year, genus, species and weight)?


surveys %>%
  group_by(year,genus,species, weight) %>%
  summarize(weight_max=max(weight,na.rm=TRUE)) %>%
  filter(!is.na(weight_max))

#answer for 3
surveys %>%
  group_by(year) %>%
  filter(weight==max(weight,na.rm=TRUE))%>%
  select(year,genus,species,weight) %>% arrange(year)


####Plotting


library(ggplot2)

surveys_complete= surveys %>% filter (species_id !="", !is.na(weight),!is.na(hindfoot_length),sex %in% c("M","F"))


View (surveys_complete)
species_count=surveys_complete %>% group_by (species_id) %>%
  tally

View (species_count)


frequent_species <- species_count %>%
  filter(n>=10) %>%
  select(species_id)

View (frequent_species)

surveys_complete2 <- surveys_complete %>%
  filter(species_id %in% frequent_species$species_id)

nrow(surveys_complete2)


#ggplot

ggplot(data=surveys_complete2,aes(x=weight,y=hindfoot_length))+ geom_point()

ggplot(data=surveys_complete2,aes(x=weight,y=hindfoot_length))+ geom_point(alpha=0.1,col="magenta")


ggplot(data=surveys_complete2,aes(x=species_id,y=hindfoot_length))+ geom_boxplot(col="magenta")


ggplot(data=surveys_complete2,aes(x=species_id,y=hindfoot_length))+ geom_boxplot(col="magenta")+geom_point (col="red")

ggplot(data=surveys_complete2,aes(x=species_id,y=hindfoot_length)) + geom_point(col="tomato",alpha=0.3) +
  geom_boxplot(col="magenta")

ggplot(data=surveys_complete2,aes(x=species_id,y=hindfoot_length)) + geom_point(col="tomato",alpha=0.3, position="jitter") +
  geom_boxplot(col="magenta")

##

yearly_counts <- surveys_complete2%>%
group_by(year,species_id) %>%
  tally

ggplot(yearly_counts,aes(x=year,y=n,group=species_id,color=species_id))+ geom_line()


######


##Faceting


ggplot(yearly_counts,aes(x=year,y=n,group=species_id,color=species_id))+ geom_line()+
facet_wrap(~species_id)

yearly_sex_counts <- surveys_complete2 %>%
  group_by(year,species_id,sex) %>%
  tally

ggplot(yearly_sex_counts,aes(x=year,y=n, group=sex, color = sex))+ geom_line ()+ facet_wrap(~ species_id)



#####Challenge


###Plot how the average weight of each species changes through the course of the experiment?


weight_ave_sp <- surveys_complete2 %>%
  group_by(year,species_id,sex) %>%
  summarize(weight_ave=mean(weight,na.rm=TRUE))

##tally special case of summarize


###Draw one line for males, and one line for females



ggplot(weight_ave_sp,aes(x=year, y=weight_ave, group=sex, color = sex)) + geom_line()+ facet_wrap(~ species_id)


##other way

surveys_complete2 %>%
  group_by(year,species_id,sex) %>%
  summarize(weight_ave=mean(weight,na.rm=TRUE)) %>%
  ggplot(aes(x=year, y=weight_ave, group=sex, color = sex)) + geom_line()+ facet_wrap(~ species_id)



##Export

ggsave("weight_ave_sp.png",width=15,height=10)

ggsave("figure/weight_ave_sp.png",width=15,height=10)


