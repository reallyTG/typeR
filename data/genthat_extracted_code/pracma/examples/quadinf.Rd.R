library(pracma)


### Name: quadinf
### Title: Infinite Integrals
### Aliases: quadinf
### Keywords: math

### ** Examples

##  We will look at the error function exp(-x^2)
f <- function(x) exp(-x^2)          # sqrt(pi)/2         theory
quadinf(f, 0, Inf)                  # 0.8862269254527413
quadinf(f, -Inf, 0)                 # 0.8862269254527413

f = function(x) sqrt(x) * exp(-x)   # 0.8862269254527579 exact
quadinf(f, 0, Inf)                  # 0.8862269254527579

f = function(x) x * exp(-x^2)       # 1/2
quadinf(f, 0, Inf)                  # 0.5

f = function(x) 1 / (1+x^2)         # 3.141592653589793 = pi
quadinf(f, -Inf, Inf)               # 3.141592653589784



