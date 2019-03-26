library(bspmma)


### Name: dirichlet.o
### Title: Mixture of Ordinary Dirichlet Model
### Aliases: dirichlet.o

### ** Examples

## Not run: 
##D data(breast.17) # the dataset
##D breast.data <- as.matrix(breast.17) # put data in matrix object
##D set.seed(1) # initialize the seed at 1 
##D diro <- dirichlet.o(breast.data, ncycles=4000, M=5)
##D 
##D ## a short description of the model and Markov chain
##D print(diro1)
##D 
##D ## the last mcmc cycle
##D diro$mcmc[4001,]
## End(Not run)



