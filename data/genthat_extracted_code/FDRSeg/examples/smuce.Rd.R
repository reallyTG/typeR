library(FDRSeg)


### Name: smuce
### Title: Piecewise constant regression with SMUCE
### Aliases: smuce
### Keywords: nonparametric

### ** Examples

# simulate data
set.seed(2)
u0 <- c(rep(1, 50), rep(5, 50))
Y  <- rnorm(100, u0)

# compute the estimate (q is automatically simulated)
uh <- smuce(Y)

# plot result
plot(Y, pch = 20, col = "grey", ylab = "", main = expression(alpha*" = 0.1"))
lines(u0, type = "s", col = "blue")
lines(evalStepFun(uh), type = "s", col = "red")
legend("topleft", c("Truth", "SMUCE"), lty = c(1, 1), col = c("blue", "red"))


# other choice of alpha
uh <- smuce(Y, alpha = 0.05)
# plot result
plot(Y, pch = 20, col = "grey", ylab = "", main = expression(alpha*" = 0.05"))
lines(u0, type = "s", col = "blue")
lines(evalStepFun(uh), type = "s", col = "red")
legend("topleft", c("Truth", "SMUCE"), lty = c(1, 1), col = c("blue", "red"))

## Not run: 
##D # alternatively simulate quantiles first
##D alpha <- 0.1
##D q     <- simulQuantile(1 - alpha, 100, type = "smuce")
##D 
##D # then compute the estimate
##D uh <- smuce(Y, q)
## End(Not run)


