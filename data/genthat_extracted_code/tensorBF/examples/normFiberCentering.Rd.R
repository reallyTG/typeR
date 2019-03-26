library(tensorBF)


### Name: normFiberCentering
### Title: Preprocessing: fiber Centering
### Aliases: normFiberCentering

### ** Examples

#Data generation
K <- 3
X <- matrix(rnorm(20*K),20,K)
W <- matrix(rnorm(30*K),30,K)
U <- matrix(rnorm(3*K),3,K)
Y = 0
for(k in 1:K) Y <- Y + outer(outer(X[,k],W[,k]),U[,k])
 Y <- Y + array(rnorm(20*30*3),dim=c(20,30,3))

#center the fibers in first mode of tensor Y
res <- normFiberCentering(Y=Y,o=1)
dim(res$data) #the centered data



