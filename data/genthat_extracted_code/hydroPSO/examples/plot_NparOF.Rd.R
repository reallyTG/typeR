library(hydroPSO)


### Name: plot_NparOF
### Title: N 2-dimensional plots of Parameter Values against the Objective
###   Function
### Aliases: plot_NparOF
### Keywords: math graph

### ** Examples

# Number of dimensions to be optimised
D <- 5

# Boundaries of the search space (Rosenbrock test function)
lower <- rep(-30, D)
upper <- rep(30, D)

## Not run: 
##D # Setting the user's home directory as working directory
##D setwd("~")
##D 
##D # Setting the seed
##D set.seed(100)
##D 
##D # Optimising the 'Rosenbrock' test function, and writing the results to text files
##D hydroPSO(fn=rosenbrock, lower=lower, upper=upper, control=list(write2disk=TRUE) ) 
##D   
##D # reading the 'Particles.txt' output file of hydroPSO
##D setwd("PSO.out")
##D particles <- read_particles(plot=FALSE)
##D                
##D # plotting the value of each parameter and the objective function against the 
##D # values of the objective function
##D plot_NparOF(params=particles[["part.params"]], gofs=particles[["part.gofs"]],
##D             gof.name="Rosenbrock", alpha=0.5)
## End(Not run)



