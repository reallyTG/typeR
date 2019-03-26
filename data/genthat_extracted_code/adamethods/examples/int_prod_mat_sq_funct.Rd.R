library(adamethods)


### Name: int_prod_mat_sq_funct
### Title: Squared interior product between matrices for FDA
### Aliases: int_prod_mat_sq_funct

### ** Examples

library(fda)
mat <- matrix(1:9, nrow = 3)
fbasis <- create.fourier.basis(rangeval = c(1, 32), nbasis = 3)
PM <- eval.penalty(fbasis)  
int_prod_mat_sq_funct(mat, PM)
                 



