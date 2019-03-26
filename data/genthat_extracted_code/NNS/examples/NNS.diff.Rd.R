library(NNS)


### Name: NNS.diff
### Title: NNS Numerical Differentiation
### Aliases: NNS.diff
### Keywords: differentiation, numerical secant

### ** Examples

f <- function(x) sin(x) / x
NNS.diff(f, 4.1)

g <- function(x) sin(x)
NNS.diff(g, 1)




