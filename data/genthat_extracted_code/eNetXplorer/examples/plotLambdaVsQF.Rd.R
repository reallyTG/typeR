library(eNetXplorer)


### Name: plotLambdaVsQF
### Title: generates plot of quality function across 'lambda'
### Aliases: plotLambdaVsQF

### ** Examples

## Don't show: 
set.seed(123)
fit = eNetXplorer(x=matrix(rnorm(75),ncol=3),y=rnorm(25),family="gaussian",
n_run=5, n_perm_null=4,alpha=c(0.5,1))
plotLambdaVsQF(x=fit,alpha.index=1)
## End(Don't show)
## No test: 
data(QuickStartEx)
fit = eNetXplorer(x=QuickStartEx$predictor,y=QuickStartEx$response,
family="gaussian",n_run=20,n_perm_null=10,seed=111)
plot(x=fit,plot.type="lambdaVsQF")
plotLambdaVsQF(x=fit,alpha.index=c(1,3),main="custom title",col.main="red")
## End(No test)



