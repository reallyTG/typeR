library(LambertW)


### Name: W
### Title: Lambert W function, its logarithm and derivative
### Aliases: W deriv_W deriv_log_W log_W log_deriv_W
### Keywords: math

### ** Examples

 
W(-0.25) # "reasonable" input event
W(-0.25, branch = -1) # "extreme" input event

curve(W(x, branch = -1), -1, 2, type = "l", col = 2, lwd = 2)
curve(W(x), -1, 2, type = "l", add = TRUE, lty = 2)
abline(v = - 1 / exp(1))

# For lower values, the principal branch gives the 'wrong' solution; 
# the non-principal must be used.
xexp(-10)
W(xexp(-10), branch = 0)
W(xexp(-10), branch = -1)
curve(log(x), 0.1, 5, lty = 2, col = 1, ylab = "")
curve(W(x), 0, 5, add = TRUE, col = "red")
curve(log_W(x), 0.1, 5, add = TRUE, col = "blue")
grid()
legend("bottomright", c("log(x)", "W(x)", "log(W(x))"),
       col = c("black", "red", "blue"), lty = c(2, 1, 1))




