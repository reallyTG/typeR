library(crs)


### Name: npglpreg
### Title: Generalized Local Polynomial Regression
### Aliases: npglpreg npglpreg.default npglpreg.formula
### Keywords: nonparametric regression

### ** Examples

## Not run: 
##D set.seed(42)
##D n <- 100
##D x1 <- runif(n,-2,2)
##D x2 <- runif(n,-2,2)
##D y <- x1^3 + rnorm(n,sd=1)
##D 
##D ## Ideally the method should choose large bandwidths for x1 and x2 and a
##D ## generalized polynomial that is a cubic for x1 and degree 0 for x2.
##D 
##D model <- npglpreg(y~x1+x2,nmulti=1)
##D summary(model)
##D 
##D ## Plot the partial means and percentile confidence intervals
##D plot(model,ci=T)
##D ## Extract the data from the plot object and plot it separately
##D myplot.dat <- plot(model,plot.behavior="data",ci=T)
##D matplot(myplot.dat[[1]][,1],myplot.dat[[1]][,-1],type="l")
##D matplot(myplot.dat[[2]][,1],myplot.dat[[2]][,-1],type="l")
## End(Not run)



