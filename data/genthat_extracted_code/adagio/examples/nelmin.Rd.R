library(adagio)


### Name: neldermead
### Title: Nelder-Mead Minimization Method
### Aliases: neldermead neldermeadb
### Keywords: optimize

### ** Examples

##  Classical tests as in the article by Nelder and Mead
# Rosenbrock's parabolic valley
rpv <- function(x) 100*(x[2] - x[1]^2)^2 + (1 - x[1])^2
x0 <- c(-2, 1)
neldermead(rpv, x0)                     #  1 1

# Fletcher and Powell's helic valley
fphv <- function(x)
    100*(x[3] - 10*atan2(x[2], x[1])/(2*pi))^2 + 
        (sqrt(x[1]^2 + x[2]^2) - 1)^2 +x[3]^2
x0 <- c(-1, 0, 0)
neldermead(fphv, x0)                    #  1 0 0

# Powell's Singular Function (PSF)
psf <- function(x)  (x[1] + 10*x[2])^2 + 5*(x[3] - x[4])^2 + 
                    (x[2] - 2*x[3])^4 + 10*(x[1] - x[4])^4
x0 <- c(3, -1, 0, 1)
neldermead(psf, x0)         #  0 0 0 0, needs maximum number of function calls

# Bounded version of Nelder-Mead
lower <- c(-Inf, 0,   0)
upper <- c( Inf, 0.5, 1)
x0 <- c(0, 0.1, 0.1)
neldermeadb(fnRosenbrock, c(0, 0.1, 0.1), lower = lower, upper = upper)
# $xmin = c(0.7085595, 0.5000000, 0.2500000)
# $fmin = 0.3353605

## Not run: 
##D # Can run Rosenbrock's function in 30 dimensions in one and a half minutes:
##D neldermead(fnRosenbrock, rep(0, 30), tol=1e-20, maxfeval=10^7)
##D # $xmin
##D #  [1]  0.9999998 1.0000004 1.0000000 1.0000001 1.0000000 1.0000001
##D #  [7]  1.0000002 1.0000001 0.9999997 0.9999999 0.9999997 1.0000000
##D # [13]  0.9999999 0.9999994 0.9999998 0.9999999 0.9999999 0.9999999
##D # [19]  0.9999999 1.0000001 0.9999998 1.0000000 1.0000003 0.9999999
##D # [25]  1.0000000 0.9999996 0.9999995 0.9999990 0.9999973 0.9999947
##D # $fmin
##D # [1] 5.617352e-10
##D # $fcount
##D # [1] 1426085
##D # elapsed time is 96.008000 seconds 
## End(Not run)



