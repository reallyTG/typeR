library(eNetXplorer)


### Name: plotMeasuredVsOOB
### Title: generates plot of response vs out-of-bag predictions across
###   instances
### Aliases: plotMeasuredVsOOB

### ** Examples

## No test: 
data(QuickStartEx)
fit = eNetXplorer(x=QuickStartEx$predictor,y=QuickStartEx$response,
family="gaussian",n_run=20,n_perm_null=10,seed=111)
plot(x=fit,plot.type="measuredVsOOB")
plotMeasuredVsOOB(x=fit,alpha.index=2)
## End(No test)
## No test: 
data(QuickStartEx)
binarized=rep("low",length(QuickStartEx$response))
binarized[QuickStartEx$response>median(QuickStartEx$response)]="high"
fit = eNetXplorer(x=QuickStartEx$predictor,y=binarized,family="binomial",n_run=20, 
n_perm_null=10,seed=111)
plot(x=fit,plot.type="measuredVsOOB")
plotMeasuredVsOOB(x=fit,alpha.index=2)
## End(No test)



