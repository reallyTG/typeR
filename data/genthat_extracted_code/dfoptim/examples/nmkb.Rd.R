library(dfoptim)


### Name: nmk
### Title: Nelder-Mead optimziation algorithm for derivative-free
###   optimization
### Aliases: nmk nmkb
### Keywords: optimize

### ** Examples

 rosbkext <- function(x){
# Extended Rosenbrock function
 n <- length(x)
 sum (100*(x[1:(n-1)]^2 - x[2:n])^2 + (x[1:(n-1)] - 1)^2)
 }

np <- 10
set.seed(123)

p0 <- rnorm(np)
xm1 <- nmk(fn=rosbkext, par=p0) # maximum `fevals' is not sufficient to find correct minimum
xm1b <- nmkb(fn=rosbkext, par=p0, lower=-2, upper=2)

### A non-smooth problem
hald <- function(x) {
#Hald J & Madsen K (1981), Combined LP and quasi-Newton methods 
#for minimax optimization, Mathematical Programming, 20, p.42-62.
	i <- 1:21
	t <- -1 + (i - 1)/10
	f <- (x[1] + x[2] * t) / ( 1 + x[3]*t + x[4]*t^2 + x[5]*t^3) - exp(t)
	max(abs(f))
	}

p0 <- runif(5)
xm2 <- nmk(fn=hald, par=p0)
xm2b <- nmkb(fn=hald, par=p0, lower=c(0,0,0,0,-2), upper=4)

## Another non-smooth functions
  nsf <- function(x) {
	f1 <- x[1]^2 + x[2]^2
	f2 <- x[1]^2 + x[2]^2 + 10 * (-4*x[1] - x[2] + 4)
	f3 <- x[1]^2 + x[2]^2 + 10 * (-x[1] - 2*x[2] + 6)
	max(f1, f2, f3)
  }
par0 <- c(1, 1)                                 # true min 7.2 at (1.2, 2.4)
nmk(par0, nsf) # fmin=8 at xmin=(2,2)




