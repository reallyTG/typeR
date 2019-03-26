library(hsdar)


### Name: apply.DistMat3D
### Title: Apply function for class DistMat3D
### Aliases: apply.DistMat3D apply,DistMat3D-method
### Keywords: utilities

### ** Examples

data(spectral_data)

## Part I: Create an object of class DistMat3D
## Calculate all possible NRI - combinations for WorldView-2-8
spec_WV <- spectralResampling(spectral_data, "WorldView2-8",
                              response_function = FALSE)
nri_WV <- nri(spec_WV, recursive = TRUE)

## Get all NRI-values as numeric vector
nri_values <- as.numeric(t(as.matrix(getNRI(nri_WV, 
                                            getFiniteNri(nri_WV)))))

## Create object of class DistMat3D
dmat <- distMat3D(nri_values, 8, 45)


## Part II: Apply function mean to values in the new object
## Calculate mean value of all samples for all indices 
meanIndexVals <- apply(dmat, MARGIN = 1, FUN = mean)
## Convert to DistMat3D
meanIndexVals <- distMat3D(meanIndexVals, 8, 1)

## Same but for array
nri_WV_dat <- as.array(dmat)
meanIndexVals_arr <- apply(nri_WV_dat, MARGIN = c(1, 2), FUN = mean)
## Convert to DistMat3D
meanIndexVals_arr <- distMat3D(meanIndexVals_arr)

## Test if equal
all(meanIndexVals_arr == meanIndexVals)


## Calculate mean value of all indices wihtin each sample
meanSampleVals <- apply(dmat, MARGIN = 3, FUN = mean)
meanSampleVals_arr <- apply(nri_WV_dat, MARGIN = 3, FUN = mean, 
                            na.rm = TRUE)
## Test if equal
all(meanSampleVals == meanSampleVals_arr)

## User-defined function (in this case the median)
quant <- function(x)
  return(quantile(x,  probs = 0.5))
## Apply user defined function to all samples for all indices 
medianIndexVals <- apply(dmat, MARGIN = 1, FUN = quant)



