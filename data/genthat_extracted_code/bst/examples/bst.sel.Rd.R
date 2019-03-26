library(bst)


### Name: bst.sel
### Title: Function to select number of predictors
### Aliases: bst.sel
### Keywords: models regression

### ** Examples

## Not run: 
##D x <- matrix(rnorm(100*100), nrow = 100, ncol = 100)
##D y <- x[,1] * 2 + x[,2] * 2.5 + rnorm(100)
##D sel <- bst.sel(x, y, q=10)
##D library("hdi")
##D fit.multi <- hdi(x, y, method = "multi.split",
##D model.selector =bst.sel,
##D args.model.selector=list(type="firstq", q=10))
##D fit.multi
##D fit.multi$pval[1:10] ## the first 10 p-values
##D fit.multi <- hdi(x, y, method = "multi.split",
##D model.selector =bst.sel,
##D args.model.selector=list(type="cv"))
##D fit.multi
##D fit.multi$pval[1:10] ## the first 10 p-values
## End(Not run)



