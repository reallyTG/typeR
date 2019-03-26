library(hesim)


### Name: rdirichlet_mat
### Title: Random generation for multiple Dirichlet distributions
### Aliases: rdirichlet_mat

### ** Examples

alpha <- matrix(c(100, 200, 500, 50, 70, 75), ncol = 3, nrow = 2, byrow = TRUE)
samp <- rdirichlet_mat(100, alpha)
print(samp[, , 1:2])



