library(bspmma)


### Name: draw.post
### Title: Overlapping Plots of Posterior Distributions for Several Models
### Aliases: draw.post

### ** Examples

## Not run: 
##D ## Conditional Dirichlet model
##D 
##D ## Set up the breast cancer dataset.
##D 
##D data(breast.17) 
##D breast.data <- as.matrix(breast.17) # Data must be a matrix object.
##D 
##D ##  Generate at least two chains, from models which are the same except
##D ## for different \eqn{M}{M} values.
##D 
##D set.seed(1) # initialize the seed at 1 for test purposes
##D breast.c1 <- dirichlet.c(breast.data, ncycles=4000, M=5)
##D breast.c2 <- dirichlet.c(breast.data,ncycles=4000, M=1000)
##D 
##D ##  Create list object.
##D 
##D breast.c1c2 <- list("5"=breast.c1$chain, "1000"= breast.c2$chain)
##D 
##D ##  Decide on some number of initial runs to omit from the analysis.
##D 
##D draw.post(breast.c1c2, burnin=100) # plots for hyperparameters only
## End(Not run)



