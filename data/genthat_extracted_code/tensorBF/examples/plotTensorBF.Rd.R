library(tensorBF)


### Name: plotTensorBF
### Title: Plot Tensor Components
### Aliases: plotTensorBF

### ** Examples

#Data generation
K <- 3
X <- matrix(rnorm(20*K),20,K)
W <- matrix(rnorm(30*K),30,K)
U <- matrix(rnorm(3*K),3,K)
Y = 0
for(k in 1:K) Y <- Y + outer(outer(X[,k],W[,k]),U[,k])
 Y <- Y + array(rnorm(20*30*3,0,0.25),dim=c(20,30,3))

#Run the method with default options
## Not run: res1 <- tensorBF(Y)
## Not run: plotTensorBF(res = res1,Y=Y,k=1)



