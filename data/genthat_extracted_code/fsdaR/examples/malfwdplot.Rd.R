library(fsdaR)


### Name: malfwdplot
### Title: Plots the trajectories of scaled Mahalanobis distances along the
###   search
### Aliases: malfwdplot

### ** Examples


 ## Not run: 
##D  ## Produce monitoring MD plot with all the default options.
##D  ##  Generate input structure for malfwdplot
##D  n <- 100
##D  p <- 4
##D  Y <- matrix(rnorm(n*p), ncol=p)
##D  Y[1:10,] <- Y[1:10,] + 4
##D 
##D  out <- fsmult(Y, monitoring=TRUE, init=30)
##D 
##D  ##  Produce monitoring MD plot with all the default options
##D  malfwdplot(out)
##D  
## End(Not run)



