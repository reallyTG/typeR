library(DataVisualizations)


### Name: ClassPDEplot
### Title: PDE Plot for all classes
### Aliases: ClassPDEplot

### ** Examples

## Don't show: 
data(ITS)
#clustering only for testing
Classification=c(rep(1,8805),rep(2,2389))
DataVisualizations::ClassPDEplotMaxLikeli(ITS,Classification)
## End(Don't show)

## No test: 
data(ITS)
model=AdaptGauss::AdaptGauss(ITS)
Classification=AdaptGauss::ClassifyByDecisionBoundaries(ITS,

DecisionBoundaries = AdaptGauss::BayesDecisionBoundaries(model$Means,model$SDs,model$Weights))

DataVisualizations::ClassPDEplotMaxLikeli(ITS,Classification)$ggobject
## End(No test)



