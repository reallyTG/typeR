library(hydroPSO)


### Name: ReadPlot_convergence
### Title: Reading/Plotting the values of different parameter sets
### Aliases: read_convergence plot_convergence
### Keywords: graph manip

### ** Examples

## Not run: 
##D # Setting the user home directory as working directory
##D setwd("~")
##D 
##D # Number of dimensions to be optimised
##D D <- 4
##D 
##D # Boundaries of the search space (Sphere function)
##D lower <- rep(-100, D)
##D upper <- rep(100, D)
##D 
##D # Setting the seed
##D set.seed(100)
##D 
##D # Runing PSO with the 'sphere' test function, writting the results to text files
##D hydroPSO(
##D         fn=sphere, lower=lower, upper=upper,
##D         control=list(MinMax="min", write2disk=TRUE, plot=TRUE)  
##D         )
##D   
##D # Reading the convergence measures got by running hydroPSO
##D setwd("PSO.out")
##D read_convergence()
##D 
## End(Not run)



