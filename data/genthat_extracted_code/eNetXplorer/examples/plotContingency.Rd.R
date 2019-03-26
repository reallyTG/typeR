library(eNetXplorer)


### Name: plotContingency
### Title: generates plot of response vs out-of-bag predictions across
###   classes
### Aliases: plotContingency

### ** Examples

## Don't show: 
set.seed(123)
fit = eNetXplorer(x=matrix(rnorm(120),ncol=4),y=c(rep(0,15),rep(1,15)),
family="binomial",n_run=5, n_perm_null=4,alpha=c(0.5,1))
plot(x=fit,plot.type="contingency")
plotContingency(x=fit,alpha.index=1)
## End(Don't show)
## No test: 
data(QuickStartEx)
binarized=rep("low",length(QuickStartEx$response))
binarized[QuickStartEx$response>median(QuickStartEx$response)]="high"
fit = eNetXplorer(x=QuickStartEx$predictor,y=binarized,family="binomial",n_run=20, 
n_perm_null=10,seed=111)
plot(x=fit,plot.type="contingency")
plotContingency(x=fit,alpha.index=6)
## End(No test)



