library(PredictABEL)


### Name: reclassification
### Title: Function for reclassification table and statistics.
### Aliases: reclassification
### Keywords: htest

### ** Examples
# specify dataset with outcome and predictor variables 
data(ExampleData)
# specify column number of the outcome variable
cOutcome <- 2

# fit logistic regression models
# all steps needed to construct a logistic regression model are written in a function
# called 'ExampleModels', which is described on page 4-5
riskmodel1 <- ExampleModels()$riskModel1
riskmodel2 <- ExampleModels()$riskModel2

# obtain predicted risks
predRisk1 <- predRisk(riskmodel1)
predRisk2 <- predRisk(riskmodel2)
# specify cutoff values for risk categories
cutoff <- c(0,.10,.30,1)    

# compute reclassification measures
reclassification(data=ExampleData, cOutcome=cOutcome, 
predrisk1=predRisk1, predrisk2=predRisk2, cutoff)


