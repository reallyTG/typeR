library(Omisc)


### Name: Group_function
### Title: Grouping_function
### Aliases: Group_function

### ** Examples


#the ChickWeight data is from base R
#nested is set to false because Chick and Time are crossed
Means_Chick<-Group_function(data=ChickWeight,x="weight", levels =c("Diet","Chick","Time"),
nested = FALSE, append=TRUE)



