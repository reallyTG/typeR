library(SuperPCA)


### Name: SupParafacEM
### Title: Using EM algorithm to fit the SupCP model
### Aliases: SupParafacEM

### ** Examples

sigmaF <- diag(c(100,64,36,16,4))
# F matrix n*r
Fmatrix1 <- matrix(MASS::mvrnorm(n=500,rep(0,5),sigmaF),100,5)
U<-Fmatrix1
V1 <- matrix(stats::rnorm(10*5),10,5)
V2 <- matrix(stats::rnorm(10*5),10,5)
L <- list(U,V1,V2)
X <- TensProd(L)
Y <- matrix(stats::rnorm(100*10),100,10)
R <-3
SupParafacEM(Y,X,R)




