library(PredictABEL)


### Name: fitLogRegModel
### Title: Function to fit a logistic regression model.
### Aliases: fitLogRegModel
### Keywords: models

### ** Examples
# specify dataset with outcome and predictor variables 
data(ExampleData)
# specify column number of outcome variable
cOutcome <- 2 
# specify column numbers of non-genetic predictors
cNonGenPred <- c(3:10)
# specify column numbers of non-genetic predictors that are categorical      
cNonGenPredCat <- c(6:8)
# specify column numbers of genetic predictors
cGenPred <- c(11,13:16)
# specify column numbers of genetic predictors that are categorical
cGenPredCat <- c(0) 

# fit logistic regression model
riskmodel <- fitLogRegModel(data=ExampleData, cOutcome=cOutcome, 
cNonGenPreds=cNonGenPred, cNonGenPredsCat=cNonGenPredCat, 
cGenPreds=cGenPred, cGenPredsCat=cGenPredCat)

# show summary details for the fitted risk model
summary(riskmodel)


