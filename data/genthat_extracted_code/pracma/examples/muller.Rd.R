library(pracma)


### Name: muller
### Title: Muller's Method
### Aliases: muller
### Keywords: math

### ** Examples

muller(function(x) x^10 - 0.5, 0, 1)  # root: 0.9330329915368074

f <- function(x) x^4 - 3*x^3 + x^2 + x + 1
p0 <- 0.5; p1 <- -0.5; p2 <- 0.0
muller(f, p0, p1, p2)
## $root
## [1] -0.3390928-0.4466301i
## ...

##  Roots of complex functions:
fz <- function(z) sin(z)^2 + sqrt(z) - log(z)
muller(fz, 1, 1i, 1+1i)
## $root
## [1] 0.2555197+0.8948303i
## $fval
## [1] -4.440892e-16+0i
## $niter
## [1] 8
## $reltol
## [1] 3.656219e-13



