library(adabag)


### Name: autoprune
### Title: Builds automatically a pruned tree of class 'rpart'
### Aliases: autoprune
### Keywords: tree classif

### ** Examples

## rpart library should be loaded
library(rpart)
data(iris)
iris.prune<-autoprune(Species~., data=iris)
iris.prune

## Comparing the test error of rpart and autoprune
library(mlbench)
data(BreastCancer)
l <- length(BreastCancer[,1])
sub <- sample(1:l,2*l/3)

BC.rpart <- rpart(Class~.,data=BreastCancer[sub,-1],cp=-1, maxdepth=5)
BC.rpart.pred <- predict(BC.rpart,newdata=BreastCancer[-sub,-1],type="class")
tb <-table(BC.rpart.pred,BreastCancer$Class[-sub])
tb
1-(sum(diag(tb))/sum(tb))


BC.prune<-autoprune(Class~.,data=BreastCancer[,-1],subset=sub)
BC.rpart.pred <- predict(BC.prune,newdata=BreastCancer[-sub,-1],type="class")
tb <-table(BC.rpart.pred,BreastCancer$Class[-sub])
tb
1-(sum(diag(tb))/sum(tb))






