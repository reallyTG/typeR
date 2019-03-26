library(adabag)


### Name: MarginOrderedPruning.Bagging
### Title: MarginOrderedPruning.Bagging
### Aliases: MarginOrderedPruning.Bagging
### Keywords: tree classif

### ** Examples

## mlbench package should be loaded
library(mlbench)
data(Satellite)
## Separate data into 3 parts: training set, pruning set and test set
ind <- sample(3, nrow(Satellite), replace = TRUE, prob=c(0.3, 0.2,0.5))

## create bagging with training set
#increase mfinal in your own execution of this example to see 
#the real usefulness of this function
Satellite.bagging<-bagging(classes~.,data=Satellite[ind==1,],mfinal=3)
#Satellite.bagging.pred<-predict(Satellite.bagging,Satellite[ind==3,])

##pruning bagging
Satellite.bagging.pruning<-MarginOrderedPruning.Bagging(Satellite.bagging,
Satellite[ind==1,],Satellite[ind==2,])
#Satellite.bagging.pruning.pred<-predict(Satellite.bagging.pruning$prunedBagging,
#Satellite[ind==3,])

## create bagging with training and pruning set
#This example has been hidden to fulfill execution time <5s 
#Satellite.bagging2<-bagging(classes~.,data=Satellite[ind!=3,],25)
#Satellite.bagging2.pred<-predict(Satellite.bagging2,Satellite[ind==3,])




