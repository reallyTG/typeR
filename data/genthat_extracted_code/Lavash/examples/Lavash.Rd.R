library(Lavash)


### Name: Lavash
### Title: Lava Estimation for the Sum of Sparse and Dense Signals
### Aliases: Lavash
### Keywords: lava

### ** Examples

n <- 10; p <- 5
b <- matrix(0,p,1); b[1,1] <- 3; b[2:p,1] <- 0.1
X <- randn(n,p) 
Y <- X%*%b+randn(n,1)
K<-5
iter<-50
Lambda2<-c(0.01, 0.07, 0.2, 0.7, 3,10,60,1000,2000)
Lambda1<-seq(0.01,6,6/50)

result<-Lavash(X,Y,K,Lambda1,Lambda2,method="profile", Maxiter = iter)

result$lava_dense
result$lava_sparse
result$lava_estimate
result$postlava_dense
result$postlava_sparse
result$post_lava
result$LAMBDA



