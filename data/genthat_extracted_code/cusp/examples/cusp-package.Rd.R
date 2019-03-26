library(cusp)


### Name: cusp-package
### Title: Cusp Catastrophe Modeling
### Aliases: cusp-package
### Keywords: package

### ** Examples

set.seed(123)
# fitting cusp to cusp data
x <- rcusp(100, alpha=0, beta=1)
fit <- cusp(y ~ x, alpha ~ 1, beta ~ 1)
print(fit)

# example with regressors
## Not run: 
##D x1 = runif(150)
##D x2 = runif(150)
##D z = Vectorize(rcusp)(1, 4*x1-2, 4*x2-1)
##D data <- data.frame(x1, x2, z)
##D fit <- cusp(y ~ z, alpha ~ x1+x2, beta ~ x1+x2, data)
##D print(fit)
##D summary(fit)
##D plot(fit)
##D cusp3d(fit)
## End(Not run)

# use of OK
npar <- length(fit$par)
## Not run: 
##D while(!fit$OK) # refit if necessary until convergence is OK
##D     fit <- cusp(y ~ z, alpha ~ x1+x2, beta ~ x1+x2, data, start=rnorm(npar))
## End(Not run)

## Not run: 
##D # example 1 from paper
##D data(attitudes)
##D data(attitudeStartingValues)
##D fit.attitudes <- cusp(y ~ Attitude, alpha ~ Orient + Involv, beta ~ Involv,
##D  data = attitudes, start=attitudeStartingValues)
##D 
##D summary(fit.attitudes)
##D plot(fit.attitudes)
##D cusp3d(fit.attitudes, B = 0.75, Y = 1.35, theta = 170, phi = 30, Yfloor = -9)
## End(Not run)



