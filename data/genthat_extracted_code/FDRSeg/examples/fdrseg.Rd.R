library(FDRSeg)


### Name: fdrseg
### Title: Piecewise constant regression with FDRSeg
### Aliases: fdrseg
### Keywords: nonparametric

### ** Examples

# simulate data
set.seed(123)
u0 <- c(rep(1, 50), rep(5, 50))
Y  <- rnorm(100, u0)

# compute the estimate (q is automatically simulated)
# it might take a while due to simulating quantiles and will
# be faster for later calls on signals of the same length
uh <- fdrseg(Y)

# plot result
plot(Y, pch = 20, col = "grey", ylab = "", main = expression(alpha*" = 0.1"))
lines(u0, type = "s", col = "blue")
lines(evalStepFun(uh), type = "s", col = "red")
legend("topleft", c("Truth", "FDRSeg"), lty = c(1, 1), col = c("blue", "red"))


# other choice of alpha
uh <- fdrseg(Y, alpha = 0.05)
# plot result
plot(Y, pch = 20, col = "grey", ylab = "", main = expression(alpha*" = 0.05"))
lines(u0, type = "s", col = "blue")
lines(evalStepFun(uh), type = "s", col = "red")
legend("topleft", c("Truth", "FDRSeg"), lty = c(1, 1), col = c("blue", "red"))

## Not run: 
##D # alternatively simulate quantiles first
##D alpha <- 0.1
##D q     <- simulQuantile(1 - alpha, 100, type = "fdrseg")
##D 
##D # then compute the estimate
##D uh <- fdrseg(Y, q)
## End(Not run)



