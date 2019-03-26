library(kernelFactory)


### Name: kernelFactory
### Title: Binary classification with Kernel Factory
### Aliases: kernelFactory
### Keywords: classification

### ** Examples

#Credit Approval data available at UCI Machine Learning Repository
data(Credit)
#take subset (for the purpose of a quick example) and train and test
Credit <- Credit[1:100,]
train.ind <- sample(nrow(Credit),round(0.5*nrow(Credit)))

#Train Kernel Factory on training data
kFmodel <- kernelFactory(x=Credit[train.ind,names(Credit)!= "Response"],
          y=Credit[train.ind,"Response"], method=random)

#Deploy Kernel Factory to predict response for test data
#predictedresponse <- predict(kFmodel, newdata=Credit[-train.ind,names(Credit)!= "Response"])



