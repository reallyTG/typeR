library(rTensor)


### Name: kronecker_list
### Title: List Kronecker Product
### Aliases: kronecker_list

### ** Examples

smalllizt <- list('mat1' = matrix(runif(12),ncol=4), 
'mat2' = matrix(runif(12),ncol=4),
'mat3' = matrix(runif(12),ncol=4))
dim(kronecker_list(smalllizt))



