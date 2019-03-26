library(rTensor)


### Name: Ops-methods
### Title: Conformable elementwise operators for Tensor
### Aliases: Ops,Tensor,Tensor-method Ops,Tensor,array-method
###   Ops,Tensor,numeric-method Ops,array,Tensor-method
###   Ops,numeric,Tensor-method Ops-methods

### ** Examples

tnsr <- rand_tensor(c(3,4,5))
tnsr2 <- rand_tensor(c(3,4,5))
tnsrsum <- tnsr + tnsr2
tnsrdiff <- tnsr - tnsr2
tnsrelemprod <- tnsr * tnsr2
tnsrelemquot <- tnsr / tnsr2
for (i in 1:3L){
for (j in 1:4L){
	for (k in 1:5L){
		stopifnot(tnsrsum@data[i,j,k]==tnsr@data[i,j,k]+tnsr2@data[i,j,k])
		stopifnot(tnsrdiff@data[i,j,k]==(tnsr@data[i,j,k]-tnsr2@data[i,j,k]))
		stopifnot(tnsrelemprod@data[i,j,k]==tnsr@data[i,j,k]*tnsr2@data[i,j,k])
		stopifnot(tnsrelemquot@data[i,j,k]==tnsr@data[i,j,k]/tnsr2@data[i,j,k])
}
}
}



