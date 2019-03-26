library(cmna)


### Name: gaussint
### Title: Gaussian integration method driver
### Aliases: gaussint gauss.legendre gauss.laguerre gauss.hermite

### ** Examples

w = c(1, 1)
x = c(-1 / sqrt(3), 1 / sqrt(3))
f <- function(x) { x^3 + x + 1 }
gaussint(f, x, w)




