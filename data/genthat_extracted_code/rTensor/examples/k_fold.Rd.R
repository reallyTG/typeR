library(rTensor)


### Name: k_fold
### Title: k-mode Folding of Matrix
### Aliases: k_fold

### ** Examples

tnsr <- new("Tensor",3L,c(3L,4L,5L),data=runif(60))
matT2<-k_unfold(tnsr,m=2)
identical(k_fold(matT2,m=2,modes=c(3,4,5)),tnsr)



