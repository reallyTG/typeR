library(cusp)


### Name: cusp
### Title: Fit a Cusp Catatrophe Model to Data
### Aliases: cusp print.cusp
### Keywords: models multivariate

### ** Examples

set.seed(123)
# example with regressors
x1 = runif(150)
x2 = runif(150)
z = Vectorize(rcusp)(1, 4*x1-2, 4*x2-1)
data <- data.frame(x1, x2, z)
fit <- cusp(y ~ z, alpha ~ x1+x2, beta ~ x1+x2, data)
print(fit)
summary(fit)
## Not run: 
##D plot(fit)
##D cusp3d(fit)
## End(Not run)

# useful use of OK
## Not run: 
##D while(!fit$OK)
##D     fit <- cusp(y ~ z, alpha ~ x1+x2, beta ~ x1+x2, data,
##D             start=rnorm(fit$par)) # use different starting values
## End(Not run)



