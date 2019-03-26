library(DataVisualizations)


### Name: ClassMDplot
### Title: Class MD-plot for Data w.r.t. all classes
### Aliases: ClassMDplot

### ** Examples

## Don't show: 
data(ITS)
#clustering only for testing
Classification=c(rep(1,8805),rep(2,2389))
DataVisualizations::ClassMDplot(ITS,Classification)
## End(Don't show)

## No test: 
data(ITS)
model=AdaptGauss::AdaptGauss(ITS)
Classification=AdaptGauss::ClassifyByDecisionBoundaries(ITS,

DecisionBoundaries = AdaptGauss::BayesDecisionBoundaries(model$Means,model$SDs,model$Weights))

DataVisualizations::ClassMDplot(ITS,Classification)
## End(No test)



