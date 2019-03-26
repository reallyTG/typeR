library(hydroPSO)


### Name: params2ecdf
### Title: Parameter Values -> Empirical CDFs
### Aliases: params2ecdf params2ecdf.default params2ecdf.matrix
###   params2ecdf.data.frame
### Keywords: math manip graph

### ** Examples

## Not run: 
##D # Setting the user's home directory as working directory
##D setwd("~")
##D 
##D # matrix with 100 random uniform parameter sets (in rows) for 10 different model's 
##D # parameters (in columns)
##D params           <- matrix(rnorm(1000), ncol=10, nrow=100)
##D colnames(params) <- paste("Param", 1:10, sep="")
##D 
##D # empirical CDFs for each one of the 10 parameters in 'params', with equal weight 
##D # for each one of the 100 parameter sets
##D params2ecdf(params, weights=rep(1,100)) 
## End(Not run)



