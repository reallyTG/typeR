library(pracma)


### Name: deval
### Title: Evaluate ODE Solution
### Aliases: deval
### Keywords: ode

### ** Examples

##  Free fall:  v' = -g - cw abs(v)^1.1,  cw = 1.6 drag coefficien
f <- function(t, y) -9.81 + 1.6*abs(y)^1.1
sol <- rk4(f, 0, 10, 0, 100)
# speed after 0.5, 1, 1.5, 2 seconds
cbind(c(0.5,1,1.5,2), -deval(sol$x, sol$y, c(0.5, 1, 1.5, 2)))
#  0.5  3.272267  m/s
#  1.0  4.507677
#  1.5  4.953259
#  2.0  5.112068
# plot(sol$x, -sol$y, type="l", col="blue"); grid()



