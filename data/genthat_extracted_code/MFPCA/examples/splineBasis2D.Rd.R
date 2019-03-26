library(MFPCA)


### Name: splineBasis2D
### Title: Calculate a spline basis representation for functional data on
###   two-dimensional domains
### Aliases: splineBasis2D splineBasis2Dpen
### Keywords: internal

### ** Examples

# simulate image data for N = 100 observations
N <- 100
b1 <- eFun(seq(0,1,0.01), M = 7, type = "Poly")
b2 <- eFun(seq(-pi, pi, 0.03), M = 8, type = "Fourier")
b <- tensorProduct(b1,b2) # 2D basis functions
scores <- matrix(rnorm(N*56), nrow = N)

# calculate observations (= linear combination of basis functions)
dat <- MFPCA:::expandBasisFunction(scores = scores, functions = b)

# calculate 2D spline basis decomposition (needs some time)
## No test: 
# use 5 basis functions in each direction
dataDec <- MFPCA:::splineBasis2D(dat, k = c(5,5)) 
## End(No test)

# add some noise to the data
noisyDat <- addError(dat, sd = 0.5)

# calculate 2D spline basis decomposition with penalization (needs A LOT more time)
## No test: 
# use 5 basis functions in each direction
noisyDataDec <- MFPCA:::splineBasis2Dpen(noisyDat, k = c(5,5)) 
## End(No test)



