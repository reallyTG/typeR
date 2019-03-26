library(uniReg)


### Name: predict.unireg
### Title: Predict method for 'unireg' objects.
### Aliases: predict.unireg
### Keywords: models regression nonparametric

### ** Examples

x <- sort(rep(0:5,20))         
n <- length(x)               
set.seed(41333)
func <- function(mu){rnorm(1,mu,0.05)}
y <- sapply(dchisq(x,3),func)

# plot of data
plot(jitter(x), y, xlab="x (jittered)")

# fit with default settings
fit <- unireg(x, y, g=5)
# short overview of the fitted spline
fit

# prediction at interim values
predict(fit, c(1.5,2.5,3.5,4.5))



