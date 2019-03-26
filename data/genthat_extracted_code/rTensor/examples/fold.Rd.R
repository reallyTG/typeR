library(rTensor)


### Name: fold
### Title: General Folding of Matrix
### Aliases: fold

### ** Examples

tnsr <- new("Tensor",3L,c(3L,4L,5L),data=runif(60))
matT3<-unfold(tnsr,row_idx=2,col_idx=c(3,1))
identical(fold(matT3,row_idx=2,col_idx=c(3,1),modes=c(3,4,5)),tnsr)



