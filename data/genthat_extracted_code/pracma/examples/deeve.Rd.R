library(pracma)


### Name: deeve
### Title: Event Detection in ODE solution
### Aliases: deeve
### Keywords: ode

### ** Examples

##  Damped pendulum:  y'' = -0.3 y' - sin(y)
#   y1 = y, y2 = y':  y1' = y2,  y2' = -0.3*y2 - sin(y1)
f <- function(t, y) {
	dy1 <- y[2]
	dy2 <- -0.3*y[2] - sin(y[1])
	return(c(dy1, dy2))
}
sol <- rk4sys(f, 0, 10, c(pi/2, 0), 100)
deeve(sol$x, sol$y[,1])                   # y1 = 0 : elongation in [sec]
# [1] 2.073507 5.414753 8.650250
# matplot(sol$x, sol$y); grid()



