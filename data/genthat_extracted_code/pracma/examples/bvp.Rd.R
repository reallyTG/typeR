library(pracma)


### Name: bvp
### Title: Boundary Value Problems
### Aliases: bvp
### Keywords: ode

### ** Examples

##  Solve y'' = 2*x/(1+x^2)*y' - 2/(1+x^2) * y + 1
##  with y(0) = 1.25 and y(4) = -0.95 on the interval [0, 4]:
f1 <- function(x) 2*x / (1 + x^2)
f2 <- function(x)  -2 / (1 + x^2)
f3 <- function(x) rep(1, length(x))     # vectorized constant function 1
x <- c(0.0,   4.0)
y <- c(1.25, -0.95)
sol <- bvp(f1, f2, f3, x, y)
## Not run: 
##D plot(sol$xs, sol$ys, ylim = c(-2, 2),
##D      xlab = "", ylab = "", main = "Boundary Value Problem")
##D # The analytic solution is
##D sfun <- function(x) 1.25 + 0.4860896526*x - 2.25*x^2 + 
##D                     2*x*atan(x) - 1/2 * log(1+x^2) + 1/2 * x^2 * log(1+x^2)
##D xx <- linspace(0, 4)
##D yy <- sfun(xx)
##D lines(xx, yy, col="red")
##D grid()
## End(Not run)



