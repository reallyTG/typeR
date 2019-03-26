library(mistral)


### Name: MonteCarlo
### Title: Crude Monte Carlo method
### Aliases: MonteCarlo

### ** Examples

#First some considerations on the usage of the lsf. 
#Limit state function defined by Kiureghian & Dakessian :
# Remember you have to consider the fact that the input will be a matrix ncol >= 1
lsf_wrong = function(x, b=5, kappa=0.5, e=0.1) {
  b - x[2] - kappa*(x[1]-e)^2 # work only with a vector of lenght 2
}
lsf_correct = function(x){
  apply(x, 2, lsf_wrong)
}
lsf = function(x, b=5, kappa=0.5, e=0.1) {
  x = as.matrix(x)
  b - x[2,] - kappa*(x[1,]-e)^2 # vectorial computation, run fast
}

y = lsf(X <- matrix(rnorm(20), 2, 10))
#Compare running time
## Not run: 
##D   require(microbenchmark)
##D   X = matrix(rnorm(2e5), 2)
##D   microbenchmark(lsf(X), lsf_correct(X))
## End(Not run)

#Example of parallel computation
require(doParallel)
lsf_par = function(x){
 foreach(x=iter(X, by='col'), .combine = 'c') %dopar% lsf(x)
}

#Try Naive Monte Carlo on a given function with different failure level
## Not run: 
##D   res = list()
##D   res[[1]] = MonteCarlo(2,lsf,q = 0,plot=TRUE)
##D   res[[2]] = MonteCarlo(2,lsf,q = 1,plot=TRUE)
##D   res[[3]] = MonteCarlo(2,lsf,q = -1,plot=TRUE)
##D   
## End(Not run)


#Try Naive Monte Carlo on a given function and change number of points.
## Not run: 
##D   res = list()
##D   res[[1]] = MonteCarlo(2,lsf,N_max = 10000)
##D   res[[2]] = MonteCarlo(2,lsf,N_max = 100000)
##D   res[[3]] = MonteCarlo(2,lsf,N_max = 500000)
## End(Not run)




