library(MultivariateRandomForest)


### Name: build_forest_predict
### Title: Prediction using Random Forest or Multivariate Random Forest
### Aliases: build_forest_predict

### ** Examples

library(MultivariateRandomForest)
#Input and Output Feature Matrix of random data (created using runif)
trainX=matrix(runif(50*100),50,100) 
trainY=matrix(runif(50*5),50,5) 
n_tree=2
m_feature=5
min_leaf=5
testX=matrix(runif(10*100),10,100) 
#Prediction size is 10 x 5, where 10 is the number 
#of testing samples and 5 is the number of output features
Prediction=build_forest_predict(trainX, trainY, n_tree, m_feature, min_leaf, testX)




