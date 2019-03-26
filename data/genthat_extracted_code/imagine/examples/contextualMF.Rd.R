library(imagine)


### Name: contextualMF
### Title: Performs Contextual Median Filter
### Aliases: contextualMF

### ** Examples

# Generate example matrix
nRows <- 50
nCols <- 100

myMatrix <- matrix(runif(nRows*nCols, 0, 100), nrow = nRows, ncol = nCols)

# Make convolution
myOutput <- contextualMF(X = myMatrix)

# Plot results
image(myOutput, zlim = c(0, 100))



