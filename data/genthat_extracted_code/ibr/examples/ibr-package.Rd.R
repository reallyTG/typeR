library(ibr)


### Name: ibr-package
### Title: Iterative Bias Reduction
### Aliases: ibr-package
### Keywords: package

### ** Examples

## Not run: 
##D data(ozone, package = "ibr")
##D res.ibr <- ibr(ozone[,-1],ozone[,1],smoother="k",df=1.1)
##D summary(res.ibr)
##D predict(res.ibr)
##D plot(res.ibr)
## End(Not run)



