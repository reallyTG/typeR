library(IntegratedMRF)


### Name: CombPredict
### Title: Integrated Prediction of Testing samples using Combination
###   Weights from integrated RF or MRF model
### Aliases: CombPredict

### ** Examples

library(IntegratedMRF)
data(Dream_Dataset)
Tree=1
Feature=1
Leaf=10
Confidence=80
finalX=Dream_Dataset[[1]]
Cell=Dream_Dataset[[2]]
Y_train_Dream=Dream_Dataset[[3]]
Y_train_cell=Dream_Dataset[[4]]
Y_test=Dream_Dataset[[5]]
Y_test_cell=Dream_Dataset[[6]]
Drug=1
Y_train_Drug=matrix(Y_train_Dream[,Drug],ncol=length(Drug))
Result=Combination(finalX,Y_train_Drug,Cell,Y_train_cell,Tree,Feature,Leaf,Confidence)

CombPredict(finalX,Y_train_Drug,Cell,Y_train_cell,Y_test_cell,Tree,Feature,Leaf,Result[[1]])



