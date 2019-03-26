library(wavelets)


### Name: waveletshift.dwt
### Title: Find Circular Shift of DWT Wavelet Coefficients
### Aliases: waveletshift.dwt
### Keywords: ts

### ** Examples

# Finding the circular shift for a wavelet transform filter of length 8,
# pertaining to DWT Wavelet Coefficients of level 5.
waveletshift.dwt(8, 5)

# If the sample size of the original time series is of length 1024.
waveletshift.dwt(8, 5, N = 1024)



