library(MFPCA)


### Name: splineFunction1D
### Title: Calculate linear combinations of spline basis functions on
###   one-dimensional domains
### Aliases: splineFunction1D
### Keywords: internal

### ** Examples

 
set.seed(1234)

# simulate coefficients (scores) for 10 observations and 8 basis functions
N <- 10
K <- 8
scores <- t(replicate(n = N, rnorm(K, sd = (K:1)/K)))
dim(scores)

# expand spline basis on [0,1]
funs <- MFPCA:::splineFunction1D(scores = scores, argvals = list(seq(0,1,0.01)),
                         bs = "ps", m = 2, k = K) # params for mgcv
                         
oldPar <- par(no.readonly = TRUE)
par(mfrow = c(1,1))                        

plot(funs, main = "Spline reconstruction")

par(oldPar)



