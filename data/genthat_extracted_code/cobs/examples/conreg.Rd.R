library(cobs)


### Name: conreg
### Title: Convex / Concave Regression
### Aliases: conreg
### Keywords: regression smooth

### ** Examples


## Generated data :
N <- 100
f <- function(X) 4*X*(1 - X)

xx <- seq(0,1, length=501)# for plotting true f()
set.seed(1)# -> conreg does not give convex cubic

x <- sort(runif(N))
y <- f(x) + 0.2 * rnorm(N)
plot(x,y, cex = 0.6)
lines(xx, f(xx), col = "blue", lty=2)
rc <- conreg(x,y)
lines(rc, col = 2, force.iSpl = TRUE)
 # 'force.iSpl': force the drawing of the cubic spline through the kinks
title("Concave Regression in R")

y2 <- y


## Trivial cases work too:
(r.1 <- conreg(1,7))
(r.2 <- conreg(1:2,7:6))
(r.3  <- conreg(1:3,c(4:5,1)))



