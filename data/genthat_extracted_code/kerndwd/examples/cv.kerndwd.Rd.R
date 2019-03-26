library(kerndwd)


### Name: cv.kerndwd
### Title: cross-validation
### Aliases: cv.kerndwd

### ** Examples

set.seed(1)
data(BUPA)
BUPA$X = scale(BUPA$X, center=TRUE, scale=TRUE)
lambda = 10^(seq(3, -3, length.out=10))
kern = rbfdot(sigma=sigest(BUPA$X))
m.cv = cv.kerndwd(BUPA$X, BUPA$y, kern, qval=1, lambda=lambda, eps=1e-5, maxit=1e5)
m.cv$lambda.min



