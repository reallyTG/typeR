library(eNetXplorer)


### Name: summaryPDF
### Title: generates PDF report with summary of main results
### Aliases: summaryPDF

### ** Examples

## No test: 
data(QuickStartEx)
fit = eNetXplorer(x=QuickStartEx$predictor,y=QuickStartEx$response, 
family="gaussian",n_run=20,n_perm_null=10,seed=111)
suppressWarnings(summaryPDF(x=fit,path=tempdir()))
## End(No test)



