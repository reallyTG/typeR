library(bvpSolve)


### Name: diagnostics.bvpSolve
### Title: Prints Diagnostic Characteristics of BVP Solvers
### Aliases: diagnostics.bvpSolve approx approx.bvpSolve
### Keywords: utilities

### ** Examples

## =============================================================================
## Diagnostic messages
## =============================================================================
f2 <- function(x, y, parms) {
 dy  <- y[2]
 dy2 <- -1/x*y[2] - (1-1/(4*x^2))*y[1] + sqrt(x)*cos(x)
 list(c(dy, dy2))
}

x    <- seq(1, 6, 0.1)
yini <- c(y = 1, dy = NA)
yend <- c(-0.5, NA)

sol   <- bvptwp(yini = yini, yend = yend, x = x, func = f2)
sol2  <- bvpcol(yini = yini, yend = yend, x = x, func = f2)
sol3  <- bvpshoot(yini = yini, yend = yend, x = x, func = f2, guess = 0)

plot(sol, which = "y")
diagnostics(sol)
diagnostics(sol2)
diagnostics(sol3)

## =============================================================================
## approx
## =============================================================================

soldetail <- approx(sol2, xout = seq(2,4,0.01))
plot(soldetail)

# beyond the interval
approx(sol2, xout = c(0,1,2))
approx(sol2, xout = c(6,100))




