library(PredictABEL)


### Name: plotROC
### Title: Function for a receiver operating characteristic curve (ROC)
###   plot and area under the ROC curve (AUC) value.
### Aliases: plotROC
### Keywords: htest hplot

### ** Examples
# specify the arguments in the function to produce ROC plot
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

# specify label of the ROC curve
labels <- c("without genetic factors", "with genetic factors")

# produce ROC curve
plotROC(data=ExampleData, cOutcome=cOutcome, 
predrisk=cbind(predRisk1,predRisk2), labels=labels)


