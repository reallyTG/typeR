library(PredictABEL)


### Name: plotPredictivenessCurve
### Title: Function for predictiveness curve.
### Aliases: plotPredictivenessCurve
### Keywords: hplot

### ** Examples
# specify dataset with outcome and predictor variables 
data(ExampleData)

# fit logistic regression models
# all steps needed to construct a logistic regression model are written in a function
# called 'ExampleModels', which is described on page 4-5
riskmodel1 <- ExampleModels()$riskModel1
riskmodel2 <- ExampleModels()$riskModel2

# obtain predicted risks
predRisk1 <- predRisk(riskmodel1)
predRisk2 <- predRisk(riskmodel2)

# specify range of y-axis
rangeyaxis <- c(0,1) 
# specify labels of the predictiveness curves
labels <- c("without genetic factors", "with genetic factors")

# produce predictiveness curves
plotPredictivenessCurve(predrisk=cbind(predRisk1,predRisk2),
rangeyaxis=rangeyaxis, labels=labels)


