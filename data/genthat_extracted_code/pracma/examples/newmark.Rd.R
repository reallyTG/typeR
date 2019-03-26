library(pracma)


### Name: newmark
### Title: Newmark Method
### Aliases: newmark
### Keywords: ode

### ** Examples

# Mathematical pendulum  m l y'' + m g sin(y) = 0
pendel <- function(t, y)  -sin(y[1])
sol <- newmark(pendel, 0, 4*pi, c(pi/4, 0))

## Not run: 
##D plot(sol$t, sol$y[, 1], type="l", col="blue",
##D      xlab="Time", ylab="Elongation/Speed", main="Mathematical Pendulum")
##D lines(sol$t, sol$y[, 2], col="darkgreen")
##D grid()
## End(Not run)



