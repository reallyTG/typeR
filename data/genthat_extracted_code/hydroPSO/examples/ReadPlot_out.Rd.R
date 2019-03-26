library(hydroPSO)


### Name: ReadPlot_out
### Title: Reading/Plotting the 'Model_out.txt' output file of hydroPSO
### Aliases: read_out plot_out
### Keywords: graph manip

### ** Examples

## Not run: 
##D # Setting the user home directory as working directory
##D setwd("~")
##D 
##D # Number of dimensions to be optimised
##D D <- 5
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
##D         control=list(maxit=100, topology="gbest", write2disk=TRUE, plot=TRUE)  
##D         )
##D 
##D # Reading the convergence measures got by running hydroPSO
##D setwd("PSO.out")
##D read_out(MinMax="min") # each particle in a different pannel
## End(Not run)



