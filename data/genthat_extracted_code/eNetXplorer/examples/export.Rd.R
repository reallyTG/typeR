library(eNetXplorer)


### Name: export
### Title: generates plain text files from eNetXplorer object
### Aliases: export

### ** Examples

## No test: 
data(QuickStartEx)
fit = eNetXplorer(x=QuickStartEx$predictor,y=QuickStartEx$response, 
family="gaussian",n_run=20,n_perm_null=10,seed=111)
export(x=fit,path=tempdir())
## End(No test)



