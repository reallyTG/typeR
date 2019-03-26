library(pracma)


### Name: euler_heun
### Title: Euler-Heun ODE Solver
### Aliases: euler_heun
### Keywords: ode

### ** Examples

##  Flame-up process
f <- function(x, y) y^2 - y^3
s1 <- cranknic(f, 0, 200, 0.01)
s2 <- euler_heun(f, 0, 200, 0.01)
## Not run: 
##D plot(s1$t, s1$y, type="l", col="blue")
##D lines(s2$t, s2$y, col="red")
##D grid()
## End(Not run)



