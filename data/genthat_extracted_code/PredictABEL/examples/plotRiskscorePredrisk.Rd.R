library(PredictABEL)


### Name: plotRiskscorePredrisk
### Title: Function to plot predicted risks against risk scores.
### Aliases: plotRiskscorePredrisk
### Keywords: hplot

### ** Examples
# specify dataset with outcome and predictor variables
data(ExampleData)

# fit a logistic regression  model
# all steps needed to construct a logistic regression model are written in a function
# called 'ExampleModels', which is described on page 4-5
riskmodel <- ExampleModels()$riskModel2

# obtain predicted risks
predRisk <- predRisk(riskmodel)

# specify column numbers of genetic predictors
cGenPred <- c(11:16)

# function to compute unweighted genetic risk scores
riskScore <- riskScore(weights=riskmodel, data=ExampleData, 
cGenPreds=cGenPred, Type="unweighted")

# specify range of x-axis
rangexaxis <- c(0,12)   
# specify range of y-axis
rangeyaxis <- c(0,1)     
# specify label of x-axis
xlabel <- "Risk score"     
# specify label of y-axis
ylabel <- "Predicted risk" 
# specify title for the plot
plottitle <- "Risk score versus predicted risk"

# produce risk score-predicted risk plot
plotRiskscorePredrisk(data=ExampleData, riskScore=riskScore, predRisk=predRisk, 
plottitle=plottitle, xlabel=xlabel, ylabel=ylabel, rangexaxis=rangexaxis, 
rangeyaxis=rangeyaxis, filename="RiskscorePredRisk.txt")


