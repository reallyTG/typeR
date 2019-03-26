library(Hmisc)


### Name: pc1
### Title: First Principal Component
### Aliases: pc1
### Keywords: multivariate

### ** Examples

set.seed(1)
x1 <- rnorm(100)
x2 <- x1 + rnorm(100)
w <- pc1(cbind(x1,x2))
attr(w,'coef')



