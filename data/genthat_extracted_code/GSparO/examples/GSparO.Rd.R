library(GSparO)


### Name: GSparO
### Title: Group sparse optimization
### Aliases: GSparO

### ** Examples

m <- 256
n <- 1024
sparsity <- 6
gLen <- 16
MaxIter <- 200
gNo <- 1024/gLen
group <- gLen*matrix(1,gNo,1)
A <- matrix(rnorm(m*n,0,1),m,n)
library(ThreeWay)
A <- orth(t(A))
A <- t(A)
gNo1 <- 1:gNo
ActInd <- sample(gNo1,gNo)
Bs <- matrix(0,n,1)
c <- matrix(rnorm(n,0,1),n,1)
for (i in 1:sparsity){
 Bs[((ActInd[i]-1)*gLen+1):(ActInd[i]*gLen)] <- matrix(1,gLen,1)}
c <- Bs*c
sigma <- 1e-3
b <- A%*%c + sigma*matrix(runif(m,min=0,max=1),m,1)
Initial <- matrix(0,n,1)
GSparO(A,b,Initial,group,MaxIter,sparsity)



