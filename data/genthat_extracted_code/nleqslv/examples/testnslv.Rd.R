library(nleqslv)


### Name: testnslv
### Title: Test different methods for solving with 'nleqslv'
### Aliases: testnslv
### Keywords: nonlinear optimize

### ** Examples

dslnex <- function(x) {
    y <- numeric(2)
    y[1] <- x[1]^2 + x[2]^2 - 2
    y[2] <- exp(x[1]-1) + x[2]^3 - 2
    y
}
xstart <- c(0.5,0.5)
fstart <- dslnex(xstart)
testnslv(xstart,dslnex)
# this will encounter an error
xstart <- c(2.0,0.5)
fstart <- dslnex(xstart)
testnslv(xstart,dslnex)



