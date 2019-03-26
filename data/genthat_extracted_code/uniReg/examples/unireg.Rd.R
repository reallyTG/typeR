library(uniReg)


### Name: unireg
### Title: Fitting a unimodal penalized spline regression.
### Aliases: unireg
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

# fit without penalty (we can use at most g=2 inner knots if k=3)
fit2 <- unireg(x, y, penalty="none", g=2)

# plot of fitted spline with or without data
plot(fit2)
plot(fit2, onlySpline=TRUE)

# fit without penalty and without constraint 
# (does not differ from fit2 with constraint in this case)
fit3 <- unireg(x, y, penalty="none", g=2, constr="none")

# plot of true and fitted functions
plot(jitter(x), y, xlab="x (jittered)")
curve(dchisq(x,3), 0, 5, type="l", col="grey", lwd=2, add=TRUE)
points(fit, lwd=2)
points(fit2, col="blue", lwd=2)
points(fit3, col="red", lwd=2)
legend("bottomright", legend = c("true mean function", 
        "difference penalized unimodal fit", 
        "unpenalized fit (with and without constraint)"),
    col=c("grey","black","red"),lwd=c(2,2,2))

# estimated variance
fit$sigmasq
fit2$sigmasq

## Not run: 
##D # fit with isotonic, antitonic and inverse-unimodal constraint (just for completeness)
##D fit4 <- unireg(x,y,constr="antitonic",g=5)
##D fit5 <- unireg(x,y,constr="isotonic",g=5)
##D fit6 <- unireg(x,y,constr="invuni",g=5)
##D 
##D points(fit4,col="orange",lwd=2)
##D points(fit5,col="brown",lwd=2)
##D points(fit6,col="yellow",lwd=2)
##D 
##D # suppose only aggregated data had been given
##D means <- c(mean(y[1:20]), mean(y[21:40]), mean(y[41:60]), mean(y[61:80]), 
##D            mean(y[81:100]), mean(y[101:120]))
##D sigmasq <- c(sd(y[1:20]),sd(y[21:40]),sd(y[41:60]),sd(y[61:80]),sd(y[81:100]),sd(y[101:120]))^2
##D 
##D # unimodal fit with differences penalty
##D fit7 <- unireg(x=unique(x), y=means, g=5, w=NULL, sigmasq=sigmasq, abstol=NULL)
##D plot(unique(x), means, pch=19, ylim=range(y))
##D curve(dchisq(x,3), 0, 5, type="l", col="grey", lwd=2, add=TRUE)
##D points(fit7, type="l", col="green", lwd=2)
##D legend("bottomright", legend = c("true mean function", "observed mean values", 
##D     "diff. penalized unimodal fit for means"),
##D   col=c("grey","black","green"), lty=c(1,NA,1), lwd=c(2,0,2), pch=c(NA,19,NA))
## End(Not run)



