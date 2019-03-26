library(rTensor)


### Name: khatri_rao_list
### Title: List Khatri-Rao Product
### Aliases: khatri_rao_list

### ** Examples

smalllizt <- list('mat1' = matrix(runif(12),ncol=4), 
'mat2' = matrix(runif(12),ncol=4),
'mat3' = matrix(runif(12),ncol=4))
dim(khatri_rao_list(smalllizt))



