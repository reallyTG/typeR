library(rTensor)


### Name: unmatvec
### Title: Unmatvec Folding of Matrix
### Aliases: unmatvec

### ** Examples

tnsr <- new("Tensor",3L,c(3L,4L,5L),data=runif(60))
matT1<-matvec(tnsr)
identical(unmatvec(matT1,modes=c(3,4,5)),tnsr)



