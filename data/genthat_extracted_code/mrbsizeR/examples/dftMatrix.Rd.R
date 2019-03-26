library(mrbsizeR)


### Name: dftMatrix
### Title: Create a n-by-n discrete Fourier transform matrix.
### Aliases: dftMatrix

### ** Examples

set.seed(987)
testMatrix <- matrix(sample(1:10, size = 25, replace = TRUE), nrow = 5)
D <- dftMatrix(5)

# Discrete Fourier transform with matrix multiplication:
D %*% testMatrix 

# Discrete Fourier transform with function fft: 
apply(testMatrix, MARGIN = 2, FUN = fft)




