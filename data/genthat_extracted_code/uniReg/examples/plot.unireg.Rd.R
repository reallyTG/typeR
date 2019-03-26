library(uniReg)


### Name: plot.unireg
### Title: Plot method for 'unireg' objects.
### Aliases: plot.unireg
### Keywords: models regression nonparametric

### ** Examples

x <- sort(rep(0:5,20))         
n <- length(x)               
set.seed(41333)
func <- function(mu){rnorm(1,mu,0.05)}
y <- sapply(dchisq(x,3),func)

# fit with default settings
fit <- unireg(x, y, g=5)
# short overview of the fitted spline
fit

# plot of fitted spline with and without data
plot(fit, col="orange")
plot(fit, onlySpline=TRUE)



