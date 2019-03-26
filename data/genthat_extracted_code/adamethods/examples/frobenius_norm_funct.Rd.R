library(adamethods)


### Name: frobenius_norm_funct
### Title: Functional Frobenius norm
### Aliases: frobenius_norm_funct

### ** Examples

library(fda)
mat <- matrix(1:9, nrow = 3)
fbasis <- create.fourier.basis(rangeval = c(1, 32), nbasis = 3)
PM <- eval.penalty(fbasis)
frobenius_norm_funct(mat, PM)
                 



