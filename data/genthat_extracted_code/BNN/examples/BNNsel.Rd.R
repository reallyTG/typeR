library(BNN)


### Name: BNNsel
### Title: Bayesian Neural Network for Variable Selection
### Aliases: BNNsel
### Keywords: BNNsel

### ** Examples

      ## Don't show: 
library(BNN)
data(Topotecan)
X <- Topotecan$X[1:5,1:3]
Y <- Topotecan$Y[1:5]
BNNsel(X,Y,hid_num = 2,lambda=0.025,total_iteration = 10, popN = 3,nCPUs = 1)
      
## End(Don't show)

## No test: 
    
## simulate data ##
library(BNN)
library(mvtnorm)
n <- 200
p <- 50
X <- rmvnorm(n, mean = rep(1,p), sigma = diag(rep(1,p))) 
eps <- rnorm(n,0,0.5)
Y <- X[,1]*X[,2]+3*sin(X[,3])-2*cos(X[,4])+X[,5]^2+eps

### fit BNN model ###
BNNsel(X,Y,hid_num = 3,lambda=0.025,total_iteration = 100000, popN = 10,nCPUs = 10)
## End(No test)



