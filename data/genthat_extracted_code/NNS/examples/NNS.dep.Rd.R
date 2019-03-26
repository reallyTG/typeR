library(NNS)


### Name: NNS.dep
### Title: NNS Dependence
### Aliases: NNS.dep
### Keywords: correlation dependence,

### ** Examples

set.seed(123)
x <- rnorm(100) ; y <- rnorm(100)
NNS.dep(x, y)

## Correlation / Dependence Matrix
x <- rnorm(100) ; y <- rnorm(100) ; z <- rnorm(100)
B <- cbind(x, y, z)
NNS.dep(B)



