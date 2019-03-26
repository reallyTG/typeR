library(eNetXplorer)


### Name: plotFeatureCaterpillar
### Title: generates caterpillar plot of feature statistics
### Aliases: plotFeatureCaterpillar

### ** Examples

## Don't show: 
set.seed(123)
fit = eNetXplorer(x=matrix(rnorm(75),ncol=3),y=rnorm(25),family="gaussian",
n_run=5, n_perm_null=4,alpha=c(0.5,1))
plotFeatureCaterpillar(x=fit,alpha.index=2,stat="coef")
## End(Don't show)
## No test: 
data(QuickStartEx)
fit = eNetXplorer(x=QuickStartEx$predictor, y=QuickStartEx$response,
family="gaussian", n_run=20, n_perm_null=10, seed=111)
plot(x=fit,plot.type="featureCaterpillar",stat="coef")
plotFeatureCaterpillar(x=fit,alpha.index=3,stat="coef",main="custom title")
## End(No test)



