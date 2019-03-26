library(MFPCA)


### Name: splineBasis1D
### Title: Calculate a spline basis decomposition for functional data on
###   one-dimensional domains
### Aliases: splineBasis1D splineBasis1Dpen
### Keywords: internal

### ** Examples

# generate some data
dat <- simFunData(argvals = seq(0,1,0.01), M = 5, 
                  eFunType = "Poly", eValType = "linear", N = 100)$simData
                  
 # calculate spline basis decomposition
 dataDec <- MFPCA:::splineBasis1D(dat) # use mgcv's default parameters
 str(dataDec)
 
 # add some noise to the data
 noisyDat <- addError(dat, sd = 0.5)
 
 # calculate spline basis decomposition with penalization to reduce noise
 noisyDataDec <- MFPCA:::splineBasis1Dpen(dat) # use mgcv's default parameters
 str(noisyDataDec)
 
 # check if noise has been filtered out by penalization
 all.equal(noisyDataDec$scores, dataDec$scores, check.attributes = FALSE)
 # -> have almost the same coefficients



