library(rmutil)


### Name: runge.kutta
### Title: Runge-Kutta Method for Solving Differential Equations
### Aliases: runge.kutta
### Keywords: math

### ** Examples

fn <- function(y,x) (x*y-y^2)/x^2
soln <- runge.kutta(fn,2,seq(1,3,by=1/128))
## exact solution
exact <- seq(1,3,by=1/128)/(0.5+log(seq(1,3,by=1/128)))
rbind(soln, exact)



