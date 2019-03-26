library(nleqslv)


### Name: searchZeros
### Title: Solve a nonlinear equation system with multiple roots from
###   multiple initial estimates
### Aliases: searchZeros
### Keywords: nonlinear optimize

### ** Examples

# Dennis Schnabel example 6.5.1 page 149 (two solutions)
set.seed(123)
dslnex <- function(x) {
    y <- numeric(2)
    y[1] <- x[1]^2 + x[2]^2 - 2
    y[2] <- exp(x[1]-1) + x[2]^3 - 2
    y
}
xstart <- matrix(runif(50, min=-2, max=2),ncol=2)
ans <- searchZeros(xstart,dslnex, method="Broyden",global="dbldog")
ans

# more complicated example
# R. Baker Kearfott, Some tests of Generalized Bisection,
# ACM Transactions on Methematical Software, Vol. 13, No. 3, 1987, pp 197-220

# A high-degree polynomial system (section 4.3 Problem 12)
# There are 12 real roots (and 126 complex roots to this system!)

hdp <- function(x) {
    f <- numeric(length(x))
    f[1] <- 5 * x[1]^9 - 6 * x[1]^5 * x[2]^2 + x[1] * x[2]^4 + 2 * x[1] * x[3]
    f[2] <- -2 * x[1]^6 * x[2] + 2 * x[1]^2 * x[2]^3 + 2 * x[2] * x[3]
    f[3] <- x[1]^2 + x[2]^2 - 0.265625
    f
}


N <- 40 # at least to find all 12 roots
set.seed(123)
xstart <- matrix(runif(3*N,min=-1,max=1), N, 3)  # N initial guesses, each of length 3
ans <- searchZeros(xstart,hdp, method="Broyden",global="dbldog")
ans$x



