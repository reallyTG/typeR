library(kexpmv)


### Name: mat2crs
### Title: Convert matrix to CRS format using SparseM function
### Aliases: mat2crs

### ** Examples

# Make a square matrix
mat=matrix(c(-0.071207, 0, 0, 0.065573, -0.041206, 0, 0.005634, 0.014206, 0), nrow=3, byrow=TRUE)

# Covert to CRS format
mat2crs(mat)
print(mat)




