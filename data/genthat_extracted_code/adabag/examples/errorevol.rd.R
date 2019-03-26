library(adabag)


### Name: errorevol
### Title: Shows the error evolution of the ensemble
### Aliases: errorevol
### Keywords: tree classif

### ** Examples


library(mlbench)
data(BreastCancer)
l <- length(BreastCancer[,1])
sub <- sample(1:l,2*l/3)
cntrl <- rpart.control(maxdepth = 3, minsplit = 0,  cp = -1)

BC.adaboost <- boosting(Class ~.,data=BreastCancer[sub,-1],mfinal=5, control=cntrl)
BC.adaboost.pred <- predict.boosting(BC.adaboost,newdata=BreastCancer[-sub,-1])

errorevol(BC.adaboost,newdata=BreastCancer[-sub,-1])->evol.test
errorevol(BC.adaboost,newdata=BreastCancer[sub,-1])->evol.train

plot.errorevol(evol.test,evol.train)
abline(h=min(evol.test[[1]]), col="red",lty=2,lwd=2)
abline(h=min(evol.train[[1]]), col="blue",lty=2,lwd=2)





