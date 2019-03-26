library(NNS)


### Name: NNS.cor
### Title: NNS Correlation
### Aliases: NNS.cor
### Keywords: correlation nonlinear

### ** Examples

set.seed(123)
## Pairwise Correlation
x <- rnorm(100) ; y <- rnorm(100)
NNS.cor(x, y)

## Correlation Matrix
x <- rnorm(100) ; y <- rnorm(100) ; z<-rnorm(100)
B <- cbind(x, y, z)
NNS.cor(B)




