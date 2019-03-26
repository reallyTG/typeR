library(hydroPSO)


### Name: read_best
### Title: Reading the 'BestParameterSet.txt' output file
### Aliases: read_best
### Keywords: manip

### ** Examples

## Not run: 
##D # Setting the user home directory as working directory
##D setwd("~")
##D 
##D # Number of dimensions to be optimised
##D D <- 4
##D 
##D # Boundaries of the search space (Sphere test function)
##D lower <- rep(-100, D)
##D upper <- rep(100, D)
##D 
##D # Setting the seed
##D set.seed(100)
##D 
##D # Runing PSO with the 'Sphere' test function, writting the results to text files
##D hydroPSO(fn=sphere, lower=lower, upper=upper,
##D         control=list(maxit=100, write2disk=TRUE, plot=TRUE)  ) 
##D   
##D # Reading the best parameter set and its corresponsing gof found by hydroPSO
##D setwd("PSO.out")
##D read_best()
## End(Not run)



