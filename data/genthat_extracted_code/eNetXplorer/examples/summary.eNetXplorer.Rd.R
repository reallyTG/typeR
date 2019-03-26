library(eNetXplorer)


### Name: summary
### Title: generates list of model statistics
### Aliases: summary summary.eNetXplorer

### ** Examples

## Don't show: 
set.seed(123)
fit = eNetXplorer(x=matrix(rnorm(75),ncol=3),y=rnorm(25),family="gaussian",
n_run=5, n_perm_null=4,alpha=c(0.5,1))
summary(fit)
## End(Don't show)
## No test: 
data(QuickStartEx)
fit = eNetXplorer(x=QuickStartEx$predictor,y=QuickStartEx$response,
family="gaussian",n_run=20,n_perm_null=10,seed=111)
summary(fit)
## End(No test)



