library(pracma)


### Name: shooting
### Title: Shooting Method
### Aliases: shooting
### Keywords: ode

### ** Examples

#-- Example 1
f <- function(t, y1, y2) -2*y1*y2
h <- function(u, v) u + v - 0.25

t0 <- 0; tfinal <- 1
y0 <- 1
sol <- shooting(f, t0, tfinal, y0, h, 0, 1)
## Not run: 
##D plot(sol$t, sol$y[, 1], type='l', ylim=c(-1, 1))
##D xs <- linspace(0, 1); ys <- 1/(xs+1)
##D lines(xs, ys, col="red")
##D lines(sol$t, sol$y[, 2], col="gray")
##D grid()
## End(Not run)

#-- Example 2
f <- function(t, y1, y2) -y2^2 / y1
h <- function(u, v) u - 2
t0 <- 0; tfinal <- 1
y0 <- 1
sol <- shooting(f, t0, tfinal, y0, h, 0, 1)



