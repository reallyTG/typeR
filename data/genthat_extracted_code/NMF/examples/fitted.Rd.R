library(NMF)


### Name: fitted
### Title: Fitted Matrix in NMF Models
### Aliases: fitted fitted-methods fitted,NMFfit-method fitted,NMF-method
###   fitted,NMFns-method fitted,NMFOffset-method fitted,NMFstd-method
### Keywords: methods

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

# random standard NMF model
x <- rnmf(3, 10, 5)
all.equal(fitted(x), basis(x) %*% coef(x))



