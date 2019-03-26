library(pracma)


### Name: rk4, rk4sys
### Title: Classical Runge-Kutta
### Aliases: rk4 rk4sys
### Keywords: ode

### ** Examples

##  Example1: ODE
# y' = y*(-2*x + 1/x) for x != 0, 1 if x = 0
# solution is x*exp(-x^2)
f <- function(x, y) {
	if (x != 0) dy <- y * (- 2*x + 1/x)
	else        dy <- rep(1, length(y))
	return(dy)
}
sol <- rk4(f, 0, 2, 0, 50)
## Not run: 
##D x <- seq(0, 2, length.out = 51)
##D plot(x, x*exp(-x^2), type = "l", col = "red")
##D points(sol$x, sol$y, pch = "*")
##D grid()
## End(Not run)

##  Example2: Chemical process
  f <- function(t, u) {
    u1 <- u[3] - 0.1 * (t+1) * u[1]
    u2 <- 0.1 * (t+1) * u[1] - 2 * u[2]
    u3 <- 2 * u[2] - u[3]
    return(c(u1, u2, u3))
  }
u0 <- c(0.8696, 0.0435, 0.0870)
a <- 0; b <- 40
n <- 40
sol <- rk4sys(f, a, b, u0, n)
## Not run: 
##D matplot(sol$x, sol$y, type = "l", lty = 1, lwd = c(2, 1, 1),
##D         col = c("darkred", "darkblue", "darkgreen"),
##D         xlab = "Time [min]", ylab= "Concentration [Prozent]",
##D         main = "Chemical composition")
##D grid()
## End(Not run)



