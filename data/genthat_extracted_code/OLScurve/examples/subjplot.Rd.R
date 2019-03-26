library(OLScurve)


### Name: subjplot
### Title: Plot individually estimated parameters
### Aliases: subjplot subjplot.OLScurve
### Keywords: OLS, growth

### ** Examples

## Not run: 
##D data <- t(t(matrix(rnorm(1000),200)) + 1:5)
##D mod <- OLScurve(~ time, data = data)
##D subjplot(mod)
##D 
##D ##quadratic
##D data <- t(t(matrix(rnorm(1000),200)) + (0:4)^2)
##D mod2 <- OLScurve(~ time + I(time^2), data = data)
##D subjplot(mod2)
##D 
##D 
## End(Not run)



