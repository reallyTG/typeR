library(PredictABEL)


### Name: plotDiscriminationBox
### Title: Function for box plots of predicted risks separately for
###   individuals with and without the outcome of interest.
### Aliases: plotDiscriminationBox
### Keywords: hplot

### ** Examples
# specify dataset with outcome and predictor variables
data(ExampleData)
# specify column number of outcome variable
cOutcome <- 2

# fit a logistic regression model
# all steps needed to construct a logistic regression model are written in a function
# called 'ExampleModels', which is described on page 4-5
riskmodel <- ExampleModels()$riskModel2

# obtain predicted risks
predRisk <- predRisk(riskmodel)
# specify labels for the groups without and with the outcome of interest 
labels <- c("Without disease", "With disease")    

# produce discrimination box plot     
plotDiscriminationBox(data=ExampleData, cOutcome=cOutcome, predrisk=predRisk, 
labels=labels)


