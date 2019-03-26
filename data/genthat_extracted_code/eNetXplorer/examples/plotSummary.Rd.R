library(eNetXplorer)


### Name: plotSummary
### Title: generates summary plots of model performance across alpha
### Aliases: plotSummary

### ** Examples

## Don't show: 
set.seed(123)
fit = eNetXplorer(x=matrix(rnorm(75),ncol=3),y=rnorm(25),family="gaussian",
n_run=5, n_perm_null=4,alpha=c(0.5,1))
suppressWarnings(plotSummary(x=fit,show.pval.ref=FALSE))
## End(Don't show)
## No test: 
data(QuickStartEx)
fit = eNetXplorer(x=QuickStartEx$predictor,y=QuickStartEx$response,
family="gaussian",n_run=20,n_perm_null=10,seed=111)
suppressWarnings(plot(x=fit, plot.type="summary"))
suppressWarnings(plotSummary(x=fit,show.pval.ref=FALSE))
## End(No test)



