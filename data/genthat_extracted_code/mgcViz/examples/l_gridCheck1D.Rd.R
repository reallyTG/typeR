library(mgcViz)


### Name: l_gridCheck1D
### Title: Binning and checking GAM residuals
### Aliases: l_gridCheck1D

### ** Examples

library(mgcViz);
set.seed(4124)
n <- 1e4
x <- rnorm(n); y <- rnorm(n);

# Residuals are heteroscedastic w.r.t. x
ob <- (x)^2 + (y)^2 + (0.2*abs(x) + 1)  * rnorm(n)
b <- bam(ob ~ s(x,k=30) + s(y, k=30), discrete = TRUE)
b <- getViz(b, nsim = 50)

# Don't see much by looking at mean
check1D(b, "x") + l_gridCheck1D()

# Heteroscedasticity clearly visible here
check1D(b, "x") + l_gridCheck1D(gridFun = sd, stand = "sc") # <- we are scaling and centering
# Last point on the right of the rug seems to indicate that a bin is missing.
# It is not an error, only on observation falls in that bin, hence the
# standard deviation is not defined there.




