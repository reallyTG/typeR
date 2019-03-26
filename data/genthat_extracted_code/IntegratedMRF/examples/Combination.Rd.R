library(IntegratedMRF)


### Name: Combination
### Title: Weights for combination of predictions from different data
###   subtypes using Least Square Regression based on various error
###   estimation techniques
### Aliases: Combination

### ** Examples

library(IntegratedMRF)
data(Dream_Dataset)
Tree=1
Feature=1
Leaf=5
Confidence=80
finalX=Dream_Dataset[[1]]
Cell=Dream_Dataset[[2]]
Y_train_Dream=Dream_Dataset[[3]]
Y_train_cell=Dream_Dataset[[4]]
Y_test=Dream_Dataset[[5]]
Y_test_cell=Dream_Dataset[[6]]
Drug=c(1,2,3)
Y_train_Drug=matrix(Y_train_Dream[,Drug],ncol=length(Drug))
Result=Combination(finalX,Y_train_Drug,Cell,Y_train_cell,Tree,Feature,Leaf,Confidence)




