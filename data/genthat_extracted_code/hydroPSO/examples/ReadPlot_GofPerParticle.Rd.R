library(hydroPSO)


### Name: ReadPlot_GofPerParticle
### Title: plotParticlesGof
### Aliases: read_GofPerParticle plot_GofPerParticle
### Keywords: files graph

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
##D # Reading the convergence measures got by running hydroPSO
##D setwd("PSO.out")
##D read_GofPerParticle() # all the particles in the same window
##D read_GofPerParticle(ptype="many") # each particle in a different pannel
##D 
## End(Not run)



