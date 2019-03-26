library(tensorBF)


### Name: normSlabScaling
### Title: Preprocessing: Slab Scaling
### Aliases: normSlabScaling

### ** Examples

#Data generation
K <- 3
X <- matrix(rnorm(20*K),20,K)
W <- matrix(rnorm(30*K),30,K)
U <- matrix(rnorm(3*K),3,K)
Y = 0
for(k in 1:K) Y <- Y + outer(outer(X[,k],W[,k]),U[,k])
 Y <- Y + array(rnorm(20*30*3),dim=c(20,30,3))

#scale the slabs in second mode of tensor Y
res <- normSlabScaling(Y=Y,o=2)
dim(res$data) #the scaled data



