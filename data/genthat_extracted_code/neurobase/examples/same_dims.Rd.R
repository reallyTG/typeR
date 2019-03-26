library(neurobase)


### Name: same_dims
### Title: Check if Objects have Same Dimensions
### Aliases: same_dims

### ** Examples

mat1 = matrix(1:9, ncol = 3)
mat2 = matrix(rnorm(9), ncol = 3)
mat3 = matrix(rnorm(16), ncol = 4)
mat4 = matrix(rnorm(9), ncol = 3)
same_dims(mat1, mat2)
same_dims(mat1, mat3)
same_dims(mat1, mat2, mat4)



