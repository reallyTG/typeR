library(nloptr)


### Name: neldermead
### Title: Nelder-Mead Simplex
### Aliases: neldermead

### ** Examples


# Fletcher and Powell's helic valley
fphv <- function(x)
    100*(x[3] - 10*atan2(x[2], x[1])/(2*pi))^2 +
        (sqrt(x[1]^2 + x[2]^2) - 1)^2 +x[3]^2
x0 <- c(-1, 0, 0)
neldermead(x0, fphv)    #  1 0 0

# Powell's Singular Function (PSF)
psf <- function(x)  (x[1] + 10*x[2])^2 + 5*(x[3] - x[4])^2 +
                    (x[2] - 2*x[3])^4 + 10*(x[1] - x[4])^4
x0 <- c(3, -1, 0, 1)
neldermead(x0, psf)     #  0 0 0 0, needs maximum number of function calls

## Not run: 
##D # Bounded version of Nelder-Mead
##D lower <- c(-Inf, 0,   0)
##D upper <- c( Inf, 0.5, 1)
##D x0 <- c(0, 0.1, 0.1)
##D S <- neldermead(c(0, 0.1, 0.1), rosenbrock, lower, upper, nl.info = TRUE)
##D # $xmin = c(0.7085595, 0.5000000, 0.2500000)
##D # $fmin = 0.3353605
## End(Not run)




