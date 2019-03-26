library(ParallelTree)


### Name: Parallel_Tree
### Title: Parallel_Tree
### Aliases: Parallel_Tree

### ** Examples

#the msleep data can be found in the ggplot2 package
#This plots the sleep totals for a number of different mammals, as well as the grand,
# order and genus mean levels of sleep.
Means_sleep<-Group_function(msleep,"sleep_total",c("order","genus"))
Parallel_Tree(Means_sleep)

#the ChickWeight data is from base R
#nested is set to false because Chick and Time are crossed
Means_Chick<-Group_function(data=ChickWeight,x="weight", levels =c("Diet","Chick","Time"),
 nested = FALSE, append=TRUE)
#Here all values not plotted are appended to the temp data frame
#created in the Parallel_Tree function
Y<-Parallel_Tree(Means_Chick, use = c("Grand Mean weight", "Diet Mean weight",
"Chick Mean weight","Time Mean weight", "weight"),
append = c("Diet","weight","Time","Chick"))
Y

#color can be added using the color functionality
Z<-Parallel_Tree(Means_Chick, use = c("Grand Mean weight", "Diet Mean weight",
"Chick Mean weight","Time Mean weight", "weight"),
color="Diet")
Z

#altering the alpha, and plotting using the negative setting,
#may be useful in cases of overplotting.
Parallel_Tree(Means_Chick, use = c("Grand Mean weight", "Diet Mean weight",
"Chick Mean weight","Time Mean weight", "weight"),
append = c("Diet","weight","Time","Chick"), a=.2, type="negative")

#geom_path is the default, although other geoms may be useful
Parallel_Tree(Means_Chick, use = c("Grand Mean weight", "Diet Mean weight",
"Chick Mean weight","Time Mean weight", "weight"),
append = c("Diet","weight","Time","Chick"), full_plot=FALSE) +
geom_boxplot(aes(group=levels))+scale_x_continuous(breaks=c(1:5),
labels=c("Grand Mean","Diet Mean", "Chick Mean", "Age Mean", "Scores"))

#Note that if facets are used the means are not recalculated.
#Such plots should be interpreted with caution.
Y+geom_path(aes(color=Diet))+facet_wrap(~Time)





