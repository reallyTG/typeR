library(tensorBF)


### Name: reconstructTensorBF
### Title: Reconstruct the data based on posterior samples
### Aliases: reconstructTensorBF

### ** Examples

#Data generation
K <- 3
X <- matrix(rnorm(20*K),20,K)
W <- matrix(rnorm(30*K),30,K)
U <- matrix(rnorm(3*K),3,K)
Y = 0
for(k in 1:K) Y <- Y + outer(outer(X[,k],W[,k]),U[,k])
 Y <- Y + array(rnorm(20*30*3,0,0.25),dim=c(20,30,3))

#Run the method with default options and reconstruct the model's representation of the tensor
## Not run: res <- tensorBF(Y)
## Not run: recon = reconstructTensorBF(res)
## Not run: inds = sample(prod(dim(Y)),100)
## Not run: plot(Y[inds],recon[inds],xlab="obs",ylab="recon",main=round(cor(Y[inds],recon[inds]),2))



