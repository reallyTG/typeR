library(gss)


### Name: ssanova9
### Title: Fitting Smoothing Spline ANOVA Models with Correlated Data
### Aliases: ssanova9 para.arma
### Keywords: smooth models regression

### ** Examples

x <- runif(100); y <- 5 + 3*sin(2*pi*x) + rnorm(x)
## independent fit
fit <- ssanova9(y~x,cov=list("known",diag(1,100)))
## AR(1) fit
fit <- ssanova9(y~x,cov=list("arma",c(1,0)))
para.arma(fit)
## MA(1) fit
e <- rnorm(101); e <- e[-1]-.5*e[-101]
x <- runif(100); y <- 5 + 3*sin(2*pi*x) + e
fit <- ssanova9(y~x,cov=list("arma",c(0,1)))
para.arma(fit)
## Clean up
## Not run: rm(x,y,e,fit)



