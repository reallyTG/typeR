library(dfoptim)


### Name: hjk
### Title: Hooke-Jeeves derivative-free minimization algorithm
### Aliases: hjk hjkb
### Keywords: optimize

### ** Examples

##  Hooke-Jeeves solves high-dim. Rosenbrock function
  rosenbrock <- function(x){
    n <- length(x)
    sum (100*(x[1:(n-1)]^2 - x[2:n])^2 + (x[1:(n-1)] - 1)^2)
  }
par0 <- rep(0, 10)
hjk(par0, rosenbrock)

hjkb(c(0, 0, 0), rosenbrock, upper = 0.5)
# $par
# [1] 0.50000000 0.25742722 0.06626892


##  Hooke-Jeeves does not work well on non-smooth functions
  nsf <- function(x) {
	f1 <- x[1]^2 + x[2]^2
	f2 <- x[1]^2 + x[2]^2 + 10 * (-4*x[1] - x[2] + 4)
	f3 <- x[1]^2 + x[2]^2 + 10 * (-x[1] - 2*x[2] + 6)
	max(f1, f2, f3)
  }
par0 <- c(1, 1)                                 # true min 7.2 at (1.2, 2.4)
hjk(par0, nsf) # fmin=8 at xmin=(2,2)



