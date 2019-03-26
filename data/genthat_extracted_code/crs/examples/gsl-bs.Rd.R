library(crs)


### Name: gsl.bs
### Title: GSL (GNU Scientific Library) B-spline/B-spline Derivatives
### Aliases: gsl.bs gsl.bs.default gsl.bs.predict
### Keywords: nonparametric

### ** Examples

## Plot the spline bases and their first order derivatives
x <- seq(0,1,length=100)
matplot(x,gsl.bs(x,degree=5),type="l")
matplot(x,gsl.bs(x,degree=5,deriv=1),type="l")

## Regression example
n <- 1000
x <- sort(runif(n))
y <- cos(2*pi*x) + rnorm(n,sd=.25)
B <- gsl.bs(x,degree=5,intercept=FALSE)
plot(x,y,cex=.5,col="grey")
lines(x,fitted(lm(y~B)))



