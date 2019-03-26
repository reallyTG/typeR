library(rTensor)


### Name: [-methods
### Title: Extract or Replace Subtensors
### Aliases: [,Tensor-method [-methods [<-,Tensor-method
###   extract,Tensor-method

### ** Examples

tnsr <- rand_tensor()
tnsr[1,2,3]
tnsr[3,1,]
tnsr[,,5]
tnsr[,,5,drop=FALSE]

tnsr[1,2,3] <- 3; tnsr[1,2,3]
tnsr[3,1,] <- rep(0,5); tnsr[3,1,]
tnsr[,2,] <- matrix(0,nrow=3,ncol=5); tnsr[,2,]



