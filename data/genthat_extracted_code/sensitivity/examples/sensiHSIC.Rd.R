library(sensitivity)


### Name: sensiHSIC
### Title: Sensitivity Indices based on Hilbert-Schmidt Independence
###   Criterion (HSIC)
### Aliases: sensiHSIC tell.sensiHSIC print.sensiHSIC plot.sensiHSIC

### ** Examples

 ## No test: 
 
  # Test case : the non-monotonic Sobol g-function
  # Only one kernel is provided with default hyperparameter value
  n <- 100
  X <- data.frame(matrix(runif(8 * n), nrow = n))
  x <- sensiHSIC(model = sobol.fun, X, kernelX = "raquad", kernelY = "rbf")
  print(x)
  
  # Test case : the Ishigami function
  # A list of kernels is given with default hyperparameter value
  n <- 100
  X <- data.frame(matrix(-pi+2*pi*runif(3 * n), nrow = n))
  x <- sensiHSIC(model = ishigami.fun, X, kernelX = c("rbf","matern3","dcov"), 
                  kernelY = "rbf")
  print(x)
  
  # A combination of kernels is given and a dummy value is passed for 
  # the first hyperparameter
  x <- sensiHSIC(model = ishigami.fun, X, kernelX = c("ssanova1","matern3","dcov"), 
                  paramX = c(1,2,1), kernelY = "ssanova1")
  print(x)
 
## End(No test)



