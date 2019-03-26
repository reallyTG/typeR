library(AppliedPredictiveModeling)


### Name: solubility
### Title: Solubility Data
### Aliases: trainX solTestXtrans solTrainY solTestX solTrainX
###   solTrainXtrans solTestY
### Keywords: datasets

### ** Examples

data(solubility)

library(caret)

### Cross-validation splits used in the book:
set.seed(100)
indx <- createFolds(solTrainY, returnTrain = TRUE)

### To re-create the transformed version of the data:
## Not run: 
##D ## Find the predictors that are not fingerprints
##D contVars <- names(solTrainX)[!grepl("FP", names(solTrainX))]
##D ## Some have zero values, so we need to add one to them so that
##D ## we can use the Box-Cox transformation. Alternatively, we could 
##D ## use the Yeo-Johnson transformation without altering the data.
##D contPredTrain <- solTrainX[,contVars] + 1
##D contPredTest  <-  solTestX[,contVars] + 1
##D 
##D pp <- preProcess(contPredTrain, method = "BoxCox")
##D contPredTrain <- predict(pp, contPredTrain)
##D contPredTest  <- predict(pp, contPredTest)
##D 
##D ## Reassemble the fingerprint data with the transformed values.
##D trainXtrans <- cbind(solTrainX[,grep("FP", names(solTrainX))], contPredTrain)
##D testXtrans  <- cbind( solTestX[,grep("FP", names(solTestX))],  contPredTest)
##D 
##D all.equal(trainXtrans, solTrainXtrans)
##D all.equal(testXtrans, solTestXtrans)
##D 	
## End(Not run)




