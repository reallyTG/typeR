library(wavelets)


### Name: scalingshift.dwt
### Title: Find Circular Shift of DWT Scaling Coefficients
### Aliases: scalingshift.dwt
### Keywords: ts

### ** Examples

# Finding the circular shift for a wavelet transform filter of length 8,
# pertaining to DWT Scaling Coefficients of level 5.
scalingshift.dwt(8, 5)

# If the sample size of the original time series is of length 1024.
scalingshift.dwt(8, 5, N = 1024)



