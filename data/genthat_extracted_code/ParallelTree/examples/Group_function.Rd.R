library(ParallelTree)


### Name: Group_function
### Title: Group_function
### Aliases: Group_function

### ** Examples

#the msleep data can be found in the ggplot2 package
#This plots the sleep totals for a number of different mammals, as well as the grand,
# order and genus mean levels of sleep.
Means_sleep<-Group_function(msleep,"sleep_total",c("order","genus"))

#the ChickWeight data is from base R
#nested is set to false because Chick and Time are crossed
Means_Chick<-Group_function(data=ChickWeight,x="weight", levels =c("Diet","Chick","Time"),
nested = FALSE, append=TRUE)



