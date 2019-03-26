library(adamethods)


### Name: frobenius_norm_funct_robust
### Title: Functional robust Frobenius norm
### Aliases: frobenius_norm_funct_robust

### ** Examples

library(fda)
mat <- matrix(1:9, nrow = 3)
fbasis <- create.fourier.basis(rangeval = c(1, 32), nbasis = 3)
PM <- eval.penalty(fbasis)
frobenius_norm_funct_robust(mat, PM, 0.8)
                           



