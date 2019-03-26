library(VGAM)


### Name: PoissonPoints
### Title: Poisson Points Distribution
### Aliases: PoissonPoints dpois.points rpois.points
### Keywords: distribution

### ** Examples

## Not run: 
##D  lambda <- 1; xvec <- seq(0, 2, length = 400)
##D plot(xvec, dpois.points(xvec, lambda, ostat = 1, dimension = 2),
##D      type = "l", las = 1, col = "blue",
##D      sub = "First order statistic",
##D      main = paste("PDF of PoissonPoints distribution with lambda = ",
##D                   lambda, " and on the plane", sep = "")) 
## End(Not run)



