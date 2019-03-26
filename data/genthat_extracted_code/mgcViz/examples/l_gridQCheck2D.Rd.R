library(mgcViz)


### Name: l_gridQCheck2D
### Title: Binning and checking QGAM residuals
### Aliases: l_gridQCheck2D

### ** Examples

library(mgcViz);
set.seed(4124)
n <- 4e2 
dat <- data.frame(x = rnorm(n), y = rnorm(n))

# Simulate some data, residuals are heteroscedastic w.r.t. x
dat$ob <- (dat$x)^2 + (dat$y)^2 + (0.2*abs(dat$x) + 1)  * rnorm(n)
b <- qgamV(ob ~ x + s(y), qu = 0.3, data = dat)

# We have a residual pattern along x (increase n above to 
# see the problem more clearly) 
check2D(b, "x", "y") + l_gridQCheck2D(qu = 0.3, bw = c(0.4, 0.4))

# We need a smooth wrt x to make the pattern disappear
## Not run: 
##D b1 <- qgamV(ob ~ s(x) + s(y), qu = 0.3, data = dat)
##D  
##D check2D(b1, "x", "y") + l_gridQCheck2D(qu = 0.3, bw = c(0.4, 0.4))
## End(Not run)




