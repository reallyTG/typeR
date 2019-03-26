library(MFPCA)


### Name: expandBasisFunction
### Title: Calculate a linear combination of arbitrary basis function
### Aliases: expandBasisFunction
### Keywords: internal

### ** Examples

# set seed
set.seed(1234)

### functions on one-dimensional domains ###

N <- 12 # 12 observations
K <- 10 # 10 basis functions

# Use the first 10 Fourier basis functions on [0,1]
x <- seq(0,1,0.01)
b <- eFun(argvals = x, M = K, type = "Fourier")

# generate N x K score matrix
scores <- t(replicate(N, rnorm(K, sd = 1 / (1:10))))

# calculate basis expansion
f <- MFPCA:::expandBasisFunction(scores = scores, functions = b) # default value for argvals

oldpar <- par(no.readonly = TRUE)

par(mfrow = c(1,2))
plot(b, main = "Basis functions")
plot(f, main = "Linear combination")
par(mfrow = c(1,1))

### functions on two-dimensional domains (images) ###

# use the same score matrix as for the one-dimensional example
dim(scores)

# Define basis functions
x1 <- seq(0, 1, 0.01)
x2 <- seq(-pi, pi, 0.05)
b <- funData(argvals = list(x1, x2), X = 1:K %o% exp(x1) %o% sin(x2))

# calculate PCA expansion
f <- MFPCA:::expandBasisFunction(scores = scores, functions = b)

# plot the resulting observations
for(i in 1:4)
 plot(f, obs = i, zlim = range(f@X))

par(oldpar)



