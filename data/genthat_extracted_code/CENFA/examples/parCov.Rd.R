library(CENFA)


### Name: parCov
### Title: Efficient calculation of covariance matrices for Raster* objects
### Aliases: parCov parCov,Raster,missing-method
###   parCov,Raster,Raster-method

### ** Examples

mat1 <- parCov(climdat.hist)

# correlation matrix
Z <- parScale(climdat.hist)
mat2 <- parCov(Z)

# covariance between two Raster* objects
mat3 <- parCov(x = climdat.hist, y = climdat.fut)




