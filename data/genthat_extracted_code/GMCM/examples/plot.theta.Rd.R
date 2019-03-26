library(GMCM)


### Name: plot.theta
### Title: Plotting method for "theta" objects
### Aliases: plot.theta

### ** Examples

set.seed(5)
theta <- rtheta(d = 3, m = 4)
## Not run: 
##D plot(theta)
##D plot(theta, col = "blue", asp = 1, add.means = FALSE)
##D plot(theta, col = "blue", asp = 1, add.means = TRUE)
##D plot(theta, which.dims = c(3L, 2L), asp = 1)
## End(Not run)
plot(theta, asp = 1, n.sd = 3, add.ellipses = TRUE,
     nlevels = 40, axes = FALSE,
     xlab = "Dimension 1", ylab = "Dimension 2")



