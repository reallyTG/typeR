library(mrbsizeR)


### Name: ifftshift
### Title: Inverse FFT shift of a 2d matrix.
### Aliases: ifftshift

### ** Examples

set.seed(987)
sampleMat <- matrix(sample(1:10, size = 25, replace = TRUE), nrow = 5)

# Swap halves along the rows:
ifftshift(sampleMat, dimension = 1)

# Swap halves along the columns:
ifftshift(sampleMat, dimension = 2)

# Swap first quadrant with third and second quadrant with fourth:
ifftshift(sampleMat, dimension = -1)




