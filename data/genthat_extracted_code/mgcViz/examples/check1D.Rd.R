library(mgcViz)


### Name: check1D
### Title: Checking GAM residuals or responses along one covariate
### Aliases: check1D

### ** Examples

### Example 1: diagnosing heteroscedasticity
library(mgcViz);
set.seed(4124)
n <- 1e4
x <- rnorm(n); y <- rnorm(n);

# Residuals are heteroscedastic w.r.t. x
ob <- (x)^2 + (y)^2 + (0.2*abs(x) + 1)  * rnorm(n)
b <- bam(ob ~ s(x,k=30) + s(y, k=30), discrete = TRUE)
b <- getViz(b)

# Look at residuals along "x"
ck <- check1D(b, "x", type = "tnormal")

# Can't see that much
ck + l_dens(type = "cond", alpha = 0.8) + l_points() + l_rug(alpha = 0.2)

## Not run: 
##D # Some evidence of heteroscedasticity
##D ck + l_densCheck()
##D 
##D # Compare observed residuals std dev with that of simulated data,
##D # heteroscedasticity is clearly visible
##D b <- getViz(b, nsim = 50)
##D check1D(b, "x") + l_gridCheck1D(gridFun = sd, showReps = TRUE)
##D 
##D # This also works with factor or logical data
##D fac <- sample(letters, n, replace = TRUE)
##D logi <- sample(c(TRUE, FALSE), n, replace = TRUE)
##D b <- bam(ob ~ s(x,k=30) + s(y, k=30) + fac + logi, discrete = TRUE)
##D b <- getViz(b, nsim = 50)
##D 
##D # Look along "fac"
##D ck <- check1D(b, "fac") 
##D ck + l_points() + l_rug() 
##D ck + l_gridCheck1D(gridFun = sd)
##D 
##D # Look along "logi"
##D ck <- check1D(b, "logi") 
##D ck + l_points() + l_rug() 
##D ck + l_gridCheck1D(gridFun = sd)
## End(Not run)




