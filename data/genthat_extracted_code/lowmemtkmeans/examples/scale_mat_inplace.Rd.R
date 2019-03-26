library(lowmemtkmeans)


### Name: scale_mat_inplace
### Title: Rescales a matrix in place.
### Aliases: scale_mat_inplace

### ** Examples

m = matrix(rnorm(24, 1, 2),4, 6)
scale_params = scale_mat_inplace(m)
sweep(sweep(m,2,scale_params[2,],'*'),2,scale_params [1,], '+') # orginal matrix restored



