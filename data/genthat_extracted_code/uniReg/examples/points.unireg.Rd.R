library(uniReg)


### Name: points.unireg
### Title: Points method for 'unireg' objects.
### Aliases: points.unireg
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

# plot of true and fitted functions
plot(jitter(x), y, xlab="x (jittered)")
curve(dchisq(x,3), 0, 5, type="l", col="grey", lwd=2, add=TRUE)
points(fit, lwd=2, col="orange")
legend("bottomright", legend = c("true mean function", 
        "difference penalized unimodal fit"),
    col=c("grey","orange"),lwd=c(2,2))



