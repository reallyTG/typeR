library(hydroPSO)


### Name: ReadPlot_particles
### Title: Reading/Plotting the 'Particles.txt' output file
### Aliases: read_particles plot_particles read_velocities
### Keywords: graph files

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
##D # reading the 'Particles.txt' output file of hydroPSO, and plotting dotty plots, 
##D # histograms, eCDFs, ...
##D setwd("PSO.out")
##D particles <- read_particles()
##D 
##D # reading only the particles in 'Particles.txt' with a goodness-of-fit value
##D # lower than 'beh.thr'
##D particles <- read_particles(beh.thr=1000, MinMax="min")
## End(Not run)



