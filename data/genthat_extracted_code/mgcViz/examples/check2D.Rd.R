library(mgcViz)


### Name: check2D
### Title: Checking GAM residuals along two covariates
### Aliases: check2D

### ** Examples

library(mgcViz);
#### Example 1: Rosenbrock function
# Simulate data
n <- 1e4
X <- data.frame("x1"=rnorm(n, 0.5, 0.5), "x2"=rnorm(n, 1.5, 1))
X$y <- (1-X$x1)^2 + 100*(X$x2 - X$x1^2)^2 + rnorm(n, 0, 2)
b <- bam(y ~ te(x1, x2, k = 5), data = X, discrete = TRUE)
b <- getViz(b, nsim = 50)

# Plot joint density of observed covariate x1 and x2
check2D(b, x1 = "x1", x2 = "x2") + l_rug() + l_dens(type="joint", alpha=0.6) + l_points()

## Not run: 
##D # Look at how mean of residuals varies across x1 and x2
##D check2D(b, x1 = "x1", x2 = "x2") + l_gridCheck2D() + l_points()
##D 
##D # Can't see much in previous plot, let's zoom in central area, where most
##D # data is. Here we can clearly see that the mean model is mispecified
##D check2D(b, x1 = "x1", x2 = "x2") + l_gridCheck2D(bw = c(0.05, 0.1)) +
##D                                    xlim(-1, 1) + ylim(0, 3)
##D # Fit can be improved by increasing k in the bam() call
##D 
##D #### Example 2: checking along factor variables
##D # Simulate data where variance changes along factor variable "fac"
##D n <- 1e4
##D X <- data.frame("x1"=rnorm(n, 0.5, 0.5), "x2"=rnorm(n, 1.5, 1))
##D X$fac <- as.factor( sample(letters, n, replace = TRUE) )
##D X$fac2 <- as.factor( sample(c("F1", "F2", "F3", "F4", "F5"), n, replace = TRUE) )
##D X$y <- (1-X$x1)^2 + 5*(X$x2 - X$x1^2)^2 + 0.1*as.numeric(X$fac) * rnorm(n, 0, 2)
##D b <- bam(y ~ te(x1, x2, k = 5) + fac + fac2, data = X, discrete = TRUE)
##D b <- getViz(b, nsim = 50)
##D 
##D # Check standard deviation of residuals along covariates "x1" and "fac"
##D a <- check2D(b, x1 = "x2", x2 = "fac")
##D a + l_gridCheck2D(gridFun = sd) + l_rug() + l_points() 
##D 
##D # Points and rug are jittered by default, but we can over-ride this
##D a + l_rug(position = position_jitter(width = 0, height = 0)) + 
##D   l_points(position = position_jitter(width = 0, height = 0)) 
##D 
##D # Check standard deviation of residuals along the two factor variables
##D a <- check2D(b, x1 = "fac", x2 = "fac2")
##D a + l_gridCheck2D(gridFun = sd, bw = c(1, 4)) + l_rug() + l_points()
## End(Not run) 




