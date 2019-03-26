library(PredictABEL)


### Name: plotPriorPosteriorRisk
### Title: Function to plot posterior risks against prior risks.
### Aliases: plotPriorPosteriorRisk
### Keywords: hplot

### ** Examples
# specify dataset with outcome and predictor variables
data(ExampleData)
# specify column number of outcome variable
cOutcome <- 2

# fit logistic regression models
# all steps needed to construct a logistic regression model are written in a function
# called 'ExampleModels', which is described on page 4-5
riskmodel1 <- ExampleModels()$riskModel1
riskmodel2 <- ExampleModels()$riskModel2

# obtain predicted risks
predRisk1 <- predRisk(riskmodel1)
predRisk2 <- predRisk(riskmodel2)

# specify label of x-axis 
xlabel <- "Prior risk"                   
# specify label of y-axis
ylabel <- "Posterior risk"               
# specify title for the plot
titleplot <- "Prior versus posterior risk" 
# specify range of the x-axis and y-axis 
rangeaxis <- c(0,1)                       
# labels given to the groups without and with the outcome of interest
labels<- c("without outcome", "with outcome")           

# produce prior risks and posterior risks plot
plotPriorPosteriorRisk(data=ExampleData, priorrisk=predRisk1,
posteriorrisk=predRisk2, cOutcome=cOutcome, xlabel=xlabel, ylabel=ylabel,   
rangeaxis=rangeaxis, plotAll=TRUE, plottitle=titleplot, labels=labels)


