library(hydroPSO)


### Name: ReadPlot_params
### Title: Reading/Plotting the values of different parameter sets
### Aliases: read_params read_params.default plot_params
###   plot_params.default plot_params.data.frame plot_params.matrix
### Keywords: graph files

### ** Examples

## Not run: 
##D # Number of dimensions of the optimisation problem 
##D D <- 4
##D 
##D # Boundaries of the search space (Sphere function)
##D lower <- rep(-100, D)
##D upper <- rep(100, D)
##D 
##D # Setting the user home directory as working directory
##D setwd("~")
##D 
##D # Setting the seed
##D set.seed(100)
##D 
##D # Runing PSO with the 'sphere' test function, writing the results to text files
##D hydroPSO(fn=sphere, lower=lower, upper=upper, 
##D          control=list(maxit=100, write2disk=TRUE, plot=TRUE) ) 
##D 
##D # 1) reading ALL the parameter sets used in PSO, and histograms (by default)
##D params <- read_params(file="~/PSO.out/Particles.txt",  param.cols=4:7, of.col=3)
##D 
##D # 2) summary of the parameter sets and their goodness-
##D                     
##D # plotting the parameter sets as dotty plots
##D plot_params(params=params[["params"]], gofs=params[["gofs"]], 
##D             ptype="dottyplot", main=fn, MinMax="min", freq=TRUE)
##D                     
##D # plotting the parameter sets as boxplots                   
##D plot_params(params=params[["params"]], ptype="boxplot", MinMax="min")
##D 
##D # plotting the parameter sets as violing plots 
##D library(vioplot)
##D plot_params(params=params[["params"]], ptype="vioplot", MinMax="min")
##D 
##D 
##D # 2) reading only the parameter sets with a goodness-of-fit measure <= 'beh.thr', 
##D #    and dotty plots (by default)
##D params <- read_params(file="~/PSO.out/Particles.txt", param.cols=4:7, of.col=3, 
##D                       beh.thr=1000, MinMax="min")
## End(Not run)



