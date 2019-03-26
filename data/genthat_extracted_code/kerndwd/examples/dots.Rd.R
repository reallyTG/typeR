library(kerndwd)


### Name: kernel functions
### Title: Kernel Functions
### Aliases: kern dots rbfdot polydot vanilladot laplacedot besseldot
###   anovadot splinedot rbfkernel-class polykernel-class
###   vanillakernel-class anovakernel-class besselkernel-class
###   laplacekernel-class splinekernel-class sigest
### Keywords: kernel methods

### ** Examples

data(BUPA)
# generate a linear kernel
kfun = vanilladot()

# generate a Laplacian kernel function with sigma = 1
kfun = laplacedot(sigma=1)

# generate a Gaussian kernel function with sigma estimated by sigest()
kfun = rbfdot(sigma=sigest(BUPA$X))

# set kern=kfun when fitting a kerndwd object
data(BUPA)
BUPA$X = scale(BUPA$X, center=TRUE, scale=TRUE)
lambda = 10^(seq(-3, 3, length.out=10))
m1 = kerndwd(BUPA$X, BUPA$y, kern=kfun,
  qval=1, lambda=lambda, eps=1e-5, maxit=1e5)



