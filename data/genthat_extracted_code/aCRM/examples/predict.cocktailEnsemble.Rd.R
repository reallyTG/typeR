library(aCRM)


### Name: predict.cocktailEnsemble
### Title: Predict method for cocktailEnsemble objects.
### Aliases: predict.cocktailEnsemble
### Keywords: classification

### ** Examples

#Credit Approval data available at UCI Machine Learning Repository
data(Credit)

#Create training set (take a small subset for demonstration purposes)
Credit <- data.frame(Credit[order(runif(nrow(Credit ))),])[1:100,c('V2','V3','V8','V11','V14','V15','Response')]
trainingset <- Credit[1:1:floor(0.50*nrow(Credit)),]
#Create test set
testset <- Credit[(floor(0.50*nrow(Credit))+1 ):nrow(Credit),]


#Train Cocktail Ensemble on training data
cE <- cocktailEnsemble(x=trainingset[,names(trainingset)!= "Response"],y=trainingset$Response)

#Deploy Kernel Factory to predict response for test data
pred <- predict(cE,testset[,names(testset)!= "Response"])




