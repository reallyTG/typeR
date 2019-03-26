library(hydroPSO)


### Name: wquantile
### Title: Weighted Quantiles
### Aliases: wquantile
### Keywords: math

### ** Examples

# random matrix with 100 parameter sets (in rows) corresponding to 10
# different parameters
params <- matrix(rnorm(1000), ncol=10, nrow=100)
colnames(params) <- paste("Param", 1:10, sep="")

# empirical CDFs for each one of the 10 parameters of x, with equal weight for 
# each one of the 100 parameter sets
wquantile(params, weights=rep(1,100), byrow=FALSE) 



