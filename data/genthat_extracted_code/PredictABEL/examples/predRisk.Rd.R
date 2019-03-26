library(PredictABEL)


### Name: predRisk
### Title: Function to compute predicted risks for all individuals in the
###   dataset.
### Aliases: predRisk
### Keywords: htest

### ** Examples
# specify dataset with outcome and predictor variables
data(ExampleData)
# specify column number of the outcome variable
cOutcome <- 2
# specify column number of ID variable
cID <- 1
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

# obtain predicted risks 
predRisk <- predRisk(riskModel=riskmodel)


