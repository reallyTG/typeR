library(kerndwd)


### Name: plot.kerndwd
### Title: plot coefficients
### Aliases: plot.kerndwd

### ** Examples

data(BUPA)
BUPA$X = scale(BUPA$X, center=TRUE, scale=TRUE)
lambda = 10^(seq(-3, 3, length.out=10))
kern = rbfdot(sigma=sigest(BUPA$X))
m1 = kerndwd(BUPA$X, BUPA$y, kern, qval=1, 
  lambda=lambda, eps=1e-5, maxit=1e5)
plot(m1, color=TRUE)



