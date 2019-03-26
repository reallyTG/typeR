library(bspmma)


### Name: describe.post
### Title: Brief summary statistics of the posterior for convenient
###   comparison of several models
### Aliases: describe.post

### ** Examples

## Not run: 
##D ## Set up the data.
##D 
##D data(breast.17) # the breast cancer dataset
##D breast.data <- as.matrix(breast.17) # put data in matrix object
##D 
##D ## Generate at least two chains, from models which are the same except
##D ## for different \eqn{M} values.
##D 
##D set.seed(1) # initialize the seed at 1 
##D breast.c1 <- dirichlet.c(breast.data, ncycles=4000, M=5)
##D breast.c2 <- dirichlet.c(breast.data,ncycles=4000, M=1000)
##D 
##D ## Create list object.
##D breast.c1c2 <- list("5"=breast.c1$chain, "1000"= breast.c2$chain)
##D 
##D ## Decide on some number of initial runs to omit from the analysis.
##D describe.post(breast.c1c2, burnin=100)
## End(Not run)



