library(pracma)


### Name: jacobian
### Title: Jacobian Matrix
### Aliases: jacobian
### Keywords: math

### ** Examples

##  Example function from Quarteroni & Saleri
f <- function(x) c(x[1]^2 + x[2]^2 - 1, sin(pi*x[1]/2) + x[2]^3)
jf <- function(x) 
          matrix( c(2*x[1], pi/2 * cos(pi*x[1]/2), 2*x[2], 3*x[2]^2), 2, 2)
all.equal(jf(c(1,1)), jacobian(f, c(1,1)))
# TRUE



