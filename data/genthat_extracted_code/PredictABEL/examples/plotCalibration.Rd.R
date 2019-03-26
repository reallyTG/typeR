library(PredictABEL)


### Name: plotCalibration
### Title: Function for calibration plot and Hosmer-Lemeshow goodness of
###   fit test.
### Aliases: plotCalibration
### Keywords: htest hplot

### ** Examples
# specify dataset with outcome and predictor variables 
data(ExampleData)
# specify column number of the outcome variable
cOutcome <- 2

# fit a logistic regression model
# all steps needed to construct a logistic regression model are written in a function
# called 'ExampleModels', which is described on page 4-5
riskmodel <- ExampleModels()$riskModel2

# obtain predicted risks
predRisk <- predRisk(riskmodel)

# specify range of x-axis and y-axis  
rangeaxis <- c(0,1) 
# specify number of groups for Hosmer-Lemeshow test            
groups <- 10 

# compute calibration measures and produce calibration plot                          
plotCalibration(data=ExampleData, cOutcome=cOutcome, predRisk=predRisk, 
groups=groups, rangeaxis=rangeaxis)


