library(rje)


### Name: Dirichlet
### Title: The Dirichlet Distribution
### Aliases: Dirichlet ddirichlet rdirichlet
### Keywords: distribution

### ** Examples

x = rdirichlet(10, c(1,2,3))
x

# Find densities at random points.
ddirichlet(x, c(1,2,3))
# Last column to be inferred.
ddirichlet(x[,c(1,2)], c(1,2,3))



