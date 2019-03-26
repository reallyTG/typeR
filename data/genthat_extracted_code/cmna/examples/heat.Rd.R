library(cmna)


### Name: heat
### Title: Heat Equation via Forward-Time Central-Space
### Aliases: heat

### ** Examples

alpha <- 1
x0 <- 0
xdelta <- .05
x <- seq(x0, 1, xdelta)
u <- sin(x^4 * pi)
tdelta <- .001
n <- 25
z <- heat(u, alpha, xdelta, tdelta, n)




