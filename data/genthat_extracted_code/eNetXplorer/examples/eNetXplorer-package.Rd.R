library(eNetXplorer)


### Name: eNetXplorer-package
### Title: explores elastic net families for generalized linear models
### Aliases: eNetXplorer-package
### Keywords: package

### ** Examples

## No test: 
data(QuickStartEx)
fit = eNetXplorer(x=QuickStartEx$predictor,y=QuickStartEx$response,
family="gaussian",n_run=20,n_perm_null=10,seed=111)
summary(fit)
plot(x=fit,plot.type="measuredVsOOB",alpha.index=4)
suppressWarnings(summaryPDF(x=fit,path=tempdir()))
export(x=fit,path=tempdir())
## End(No test)



