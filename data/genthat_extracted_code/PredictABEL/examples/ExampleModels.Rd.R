library(PredictABEL)


### Name: ExampleModels
### Title: An example code to construct a risk model using logistic
###   regression analysis.
### Aliases: ExampleModels

### ** Examples
# specify dataset with outcome and predictor variables
data(ExampleData)
# specify column number of the outcome variable
cOutcome <- 2
# specify column numbers of non-genetic predictors
cNonGenPred1 <- c(3:10)
cNonGenPred2 <- c(3:10)
# specify column numbers of non-genetic predictors that are categorical
cNonGenPredCat1 <- c(6:8)
cNonGenPredCat2 <- c(6:8)
# specify column numbers of genetic predictors
cGenPred1 <- c(0)
cGenPred2 <- c(11:16)
# specify column numbers of genetic predictors that are categorical
cGenPredsCat1 <- c(0)
cGenPredsCat2 <- c(0)

# fit logistic regression models
riskmodel1 <- fitLogRegModel(data=ExampleData, cOutcome=cOutcome,
cNonGenPreds=cNonGenPred1, cNonGenPredsCat=cNonGenPredCat1,
cGenPreds=cGenPred1, cGenPredsCat=cGenPredsCat1)
riskmodel2 <- fitLogRegModel(data=ExampleData, cOutcome=cOutcome,
cNonGenPreds=cNonGenPred2, cNonGenPredsCat=cNonGenPredCat2,
cGenPreds=cGenPred2, cGenPredsCat=cGenPredsCat2)

# combine output in a list 
ExampleModels <- list(riskModel1=riskmodel1, riskModel2=riskmodel2)


