library(hydroPSO)


### Name: plot_ParamsPerIter
### Title: Plot Parameter Values against the Iteration Number
### Aliases: plot_ParamsPerIter plot_ParamsPerIter.default
###   plot_ParamsPerIter.matrix plot_ParamsPerIter.data.frame
### Keywords: manip graph

### ** Examples

# Number of dimensions to be optimised
D <- 5

# Boundaries of the search space (Griewank test function)
lower <- rep(-600, D)
upper <- rep(600, D)

## Not run: 
##D # Setting the user's home directory as working directory
##D setwd("~")
##D 
##D # Setting the seed
##D set.seed(100)
##D 
##D # Running PSO with the 'griewank' test function, writing the results to text files
##D hydroPSO(fn=griewank, lower=lower, upper=upper,    
##D          control=list(use.IW = TRUE, IW.type= "linear", IW.w= c(1.0, 0.4),                   
##D                      write2disk=TRUE) )
##D   
##D # reading the 'Particles.txt' output file of PSO
##D setwd("PSO.out")
##D particles <- read_particles(plot=FALSE)
##D                     
##D # plotting the value of each parameter and the objective function against the 
##D # iteration number
##D plot_ParamsPerIter(particles[["part.params"]])
## End(Not run)



