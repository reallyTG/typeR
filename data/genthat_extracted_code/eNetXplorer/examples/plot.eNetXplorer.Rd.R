library(eNetXplorer)


### Name: plot
### Title: generates plots from eNetXplorer object
### Aliases: plot.eNetXplorer plot

### ** Examples

## No test: 
data(QuickStartEx)
fit = eNetXplorer(x=QuickStartEx$predictor, y=QuickStartEx$response,
family="gaussian", n_run=20, n_perm_null=10, seed=111)
suppressWarnings(plot(x=fit,plot.type="summary"))
plot(x=fit,plot.type="lambdaVsQF",alpha.index=2)
plot(x=fit,plot.type="measuredVsOOB",alpha.index=c(1,3,5))
plot(x=fit,plot.type="featureCaterpillar",stat="coef")
plot(x=fit,plot.type="featureHeatmap",stat="freq")
## End(No test)



