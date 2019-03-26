library(rTensor)


### Name: hadamard_list
### Title: List hadamard Product
### Aliases: hadamard_list

### ** Examples

lizt <- list('mat1' = matrix(runif(40),ncol=4), 
'mat2' = matrix(runif(40),ncol=4),
'mat3' = matrix(runif(40),ncol=4))
dim(hadamard_list(lizt))



