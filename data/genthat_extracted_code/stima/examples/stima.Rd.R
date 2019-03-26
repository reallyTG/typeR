library(stima)


### Name: stima
### Title: Simultaneous Threshold Interaction Modeling Algorithm
### Aliases: stima
### Keywords: regression interaction tree

### ** Examples



#Example with Boston Housing dataset from paper in JCGS
data(boston)
#grow a full regression trunk with automatic first split selection 
#and maximum number of splits = 10, with: bostonrt<-stima(boston,10)  
#NB. This analysis will take a long time (about one hour)
#inspect the output with: summary(bostonrt)
#prune the tree with: prune(bostonrt,data=boston)
#the pruned regression trunk has 7 splits
#to save time in the example, we select the splitting candidates beforehand,
#and we grow a tree with a maximum of 4 splits: 
contr<-stima.control(predtrunk=c(8,9,16)) 
bostonrt_pr<-stima(boston,4,first=16,vfold=0,Save=TRUE,control = contr) 
summary(bostonrt_pr)
#inspect the coefficients of the final regression trunk model
round(bostonrt_pr$full,digits=2)
#inspect the new data including the indicator variables referring 
#to the terminal nodes
bostonrt_pr$newdata



