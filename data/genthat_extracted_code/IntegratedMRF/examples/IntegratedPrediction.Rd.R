library(IntegratedMRF)


### Name: IntegratedPrediction
### Title: Integrated Prediction of Testing samples from integrated RF or
###   MRF model
### Aliases: IntegratedPrediction

### ** Examples

library(IntegratedMRF)
data(Dream_Dataset)
Tree=1
Feature=1
Leaf=10
finalX=Dream_Dataset[[1]]
Cell=Dream_Dataset[[2]]
Y_train_Dream=Dream_Dataset[[3]]
Y_train_cell=Dream_Dataset[[4]]
Y_test=Dream_Dataset[[5]]
Y_test_cell=Dream_Dataset[[6]]
Drug=c(1,2,3)
Y_train_Drug=matrix(Y_train_Dream[,Drug],ncol=length(Drug))
IntegratedPrediction(finalX,Y_train_Drug,Cell,Y_train_cell,Y_test_cell,Tree,Feature,Leaf)




