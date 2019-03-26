library(bspmma)


### Name: dirichlet.c
### Title: Mixture of Conditional Dirichlet Model
### Aliases: dirichlet.c

### ** Examples

## Not run: 
##D data(breast.17) # the dataset
##D breast.data <- as.matrix(breast.17) # put data in matrix object
##D set.seed(1) # initialize the seed at 1 for test purposes
##D breast.c1 <- dirichlet.c(breast.data, ncycles=4000, M=5)
##D breast.c2 <- dirichlet.c(breast.data,ncycles=4000, M=1000)
## End(Not run)



