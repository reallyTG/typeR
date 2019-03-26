library(MFPCA)


### Name: splineFunction2D
### Title: Calculate linear combinations of spline basis functions on
###   two-dimensional domains
### Aliases: splineFunction2D splineFunction2Dpen
### Keywords: internal

### ** Examples

set.seed(1234)

### Spline basis ###
# simulate coefficients (scores) for N = 4 observations and K = 7*8 basis functions
N <- 4
K <- 7*8
scores <- t(replicate(n = N, rnorm(K, sd = (K:1)/K)))
dim(scores)

# expand spline basis on [0,1] x [-0.5, 0.5]
funs <- MFPCA:::splineFunction2D(scores = scores,
                     argvals = list(seq(0,1,0.01), seq(-0.5, 0.5, 0.01)),
                     bs = "ps", m = 2, k = c(7,8)) # params for mgcv

oldPar <- par(no.readonly = TRUE)
par(mfrow = c(1,1))

# plot all observations
for(i in 1:4)
 plot(funs, obs = i, main = "Spline reconstruction")

par(oldPar)



