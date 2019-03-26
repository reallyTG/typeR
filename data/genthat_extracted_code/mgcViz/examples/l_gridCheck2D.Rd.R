library(mgcViz)


### Name: l_gridCheck2D
### Title: Binning and checking GAM residuals
### Aliases: l_gridCheck2D

### ** Examples

library(mgcViz);
set.seed(4124)
n <- 1e4
x <- rnorm(n); y <- rnorm(n);

# Residuals are heteroscedastic w.r.t. x
ob <- (x)^2 + (y)^2 + (1*abs(x) + 1)  * rnorm(n)
b <- bam(ob ~ s(x,k=30) + s(y, k=30), discrete = TRUE)
b <- getViz(b, nsim = 50)

# Don't see much by looking at mean
check2D(b, "x", "y") + l_gridCheck2D(gridFun = mean, bw = c(0.4, 0.4))

# Variance pattern along x-axis clearer now
check2D(b, "x", "y") + l_gridCheck2D(gridFun = sd, bw = c(0.4, 0.4))
 



