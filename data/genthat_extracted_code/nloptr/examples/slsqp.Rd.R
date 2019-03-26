library(nloptr)


### Name: slsqp
### Title: Sequential Quadratic Programming (SQP)
### Aliases: slsqp

### ** Examples


##  Solve the Hock-Schittkowski problem no. 100
x0.hs100 <- c(1, 2, 0, 4, 0, 1, 1)
fn.hs100 <- function(x) {
    (x[1]-10)^2 + 5*(x[2]-12)^2 + x[3]^4 + 3*(x[4]-11)^2 + 10*x[5]^6 +
                  7*x[6]^2 + x[7]^4 - 4*x[6]*x[7] - 10*x[6] - 8*x[7]
}
hin.hs100 <- function(x) {
    h <- numeric(4)
    h[1] <- 127 - 2*x[1]^2 - 3*x[2]^4 - x[3] - 4*x[4]^2 - 5*x[5]
    h[2] <- 282 - 7*x[1] - 3*x[2] - 10*x[3]^2 - x[4] + x[5]
    h[3] <- 196 - 23*x[1] - x[2]^2 - 6*x[6]^2 + 8*x[7]
    h[4] <- -4*x[1]^2 - x[2]^2 + 3*x[1]*x[2] -2*x[3]^2 - 5*x[6]	+11*x[7]
    return(h)
}

S <- slsqp(x0.hs100, fn = fn.hs100,     # no gradients and jacobians provided
           hin = hin.hs100,
           control = list(xtol_rel = 1e-8, check_derivatives = TRUE))
S
## Optimal value of objective function:  690.622270249131   *** WRONG ***

# Even the numerical derivatives seem to be too tight.
# Let's try with a less accurate jacobian.

hinjac.hs100 <- function(x) nl.jacobian(x, hin.hs100, heps = 1e-2)
S <- slsqp(x0.hs100, fn = fn.hs100,
           hin = hin.hs100, hinjac = hinjac.hs100,
           control = list(xtol_rel = 1e-8))
S
## Optimal value of objective function:  680.630057392593   *** CORRECT ***




