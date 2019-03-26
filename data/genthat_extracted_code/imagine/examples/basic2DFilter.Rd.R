library(imagine)


### Name: meanFilter
### Title: Make a 2D filter calculations from numeric matrix
### Aliases: meanFilter quantileFilter medianFilter

### ** Examples

# Generate example matrix
nRows <- 50
nCols <- 100

myMatrix <- matrix(runif(nRows*nCols, 0, 100), nrow = nRows, ncol = nCols)
radius <- 3

# Make convolution
myOutput1 <- meanFilter(myMatrix, radius)
myOutput2 <- quantileFilter(myMatrix, radius, 0.1)
myOutput3 <- medianFilter(myMatrix, radius)

# Plot results
image(myMatrix, zlim = c(0, 100))
image(myOutput1, zlim = c(0, 100))
image(myOutput2, zlim = c(0, 100))
image(myOutput3, zlim = c(0, 100))



