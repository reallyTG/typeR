library(propagate)


### Name: fitDistr
### Title: Fitting distributions to observations/Monte Carlo simulations
### Aliases: fitDistr
### Keywords: algebra univariate

### ** Examples

## Not run: 
##D ## Linear example, small error
##D ## => Normal distribution.
##D EXPR1 <- expression(x + 2 * y)
##D x <- c(5, 0.01)
##D y <- c(1, 0.01)
##D DF1 <- cbind(x, y)
##D RES1 <- propagate(expr = EXPR1, data = DF1, type = "stat", 
##D                   do.sim = TRUE, verbose = TRUE)
##D fitDistr(RES1)
##D 
##D ## Ratio example, larger error
##D ## => Gamma distribution.
##D EXPR2 <- expression(x/2 * y)
##D x <- c(5, 0.1)
##D y <- c(1, 0.02)
##D DF2 <- cbind(x, y)
##D RES2 <- propagate(expr = EXPR2, data = DF2, type = "stat", 
##D                   do.sim = TRUE, verbose = TRUE)
##D fitDistr(RES2)
##D 
##D ## Exponential example, large error
##D ## => Log-Normal distribution.
##D EXPR3 <- expression(x^(2 * y))
##D x <- c(5, 0.1)
##D y <- c(1, 0.1)
##D DF3 <- cbind(x, y)
##D RES3 <- propagate(expr = EXPR3, data = DF3, type = "stat", 
##D                   do.sim = TRUE, verbose = TRUE)
##D fitDistr(RES3)
##D 
##D ## Rectangular input distributions result
##D ## in Curvilinear Trapezoidal output distribution.
##D A <- runif(100000, 20, 25)
##D B <- runif(100000, 3, 3.5)
##D DF4 <- cbind(A, B)
##D EXPR4 <- expression(A + B)
##D RES4 <- propagate(EXPR4, data = DF4, type = "sim", 
##D                  use.cov = FALSE, do.sim = TRUE)
##D fitDistr(RES4)        
##D 
##D ## Fitting with 1/counts as weights.
##D EXPR5 <- expression(x + 2 * y)
##D x <- c(5, 0.05)
##D y <- c(1, 0.05)
##D DF5 <- cbind(x, y)
##D RES5 <- propagate(expr = EXPR5, data = DF5, type = "stat", 
##D                   do.sim = TRUE, verbose = TRUE, weights = TRUE)
##D fitDistr(RES5)
##D 
##D ## Using only selected distributions.
##D EXPR6 <- expression(x + sin(y))
##D x <- c(5, 0.1)
##D y <- c(1, 0.2)
##D DF6 <- cbind(x, y)
##D RES6 <- propagate(expr = EXPR6, data = DF6, type = "stat", 
##D                   do.sim = TRUE)
##D fitDistr(RES6, distsel = c(1:10, 15, 28))
## End(Not run)



