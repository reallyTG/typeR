library(IndependenceTests)


### Name: dependogram
### Title: Nonparametric tests of independence between random vectors
### Aliases: dependogram

### ** Examples



n <- 100
W1 <- rpois(n,1)
W3 <- rpois(n,1)
W4 <- rpois(n,1)
W6 <- rpois(n,1)
W2 <- rpois(n,3)
W5 <- rpois(n,3)
X1 <- W1 + W2
X2 <- W2 + W3
X3 <- W4 + W5
X4 <- W5 + W6
X <- cbind(X1,X2,X3,X4)
dependogram(X,vecd.ou.p=c(1,1,1,1),N=10,B=20,alpha=0.05,display=TRUE,graphics=TRUE)

n <- 50
Sigma <- matrix(c(1, 0, 0, 0, 0, 0,
                  0, 1, 0, 0, 0, 0,
                  0, 0, 1, 0,.4,.5,
                  0, 0, 0, 1,.1,.2,
                  0, 0,.4,.1, 1, 0,
                  0, 0,.5,.2, 0, 1),nrow=6,ncol=6,byrow=TRUE)
W <- chol(Sigma) 
X1 <- cbind(W[1,],W[2,])
X2 <- cbind(W[3,],W[4,])
X3 <- cbind(W[5,],W[6,])
X <- cbind(X1,X2,X3)
## No test: 
dependogram(X,vecd.ou.p=c(2,2,2),N=10,B=20,alpha=0.05,display=TRUE,graphics=TRUE)
## End(No test)

n <- 100
W <- sample(x=1:8,size=n,TRUE)
X1 <- W 
X2 <- W 
X3 <- W 
X4 <- W 
X <- cbind(X1,X2,X3,X4)
dependogram(X,vecd.ou.p=c(1,1,1,1),N=10,B=20,alpha=0.05,display=TRUE,graphics=TRUE)

n <- 100
W <- rbinom(n,1,0.8)
Y <- W[1:(n-3)]*W[4:n]
dependogram(W,vecd.ou.p=4,N=10,B=20,alpha=0.05,display=TRUE,graphics=TRUE)
dependogram(Y,vecd.ou.p=4,N=10,B=20,alpha=0.05,display=TRUE,graphics=TRUE)

n <- 75
U <- matrix(rnorm(2*n),nrow=n,ncol=2)
W <- U[1:(n-1),] + sqrt(2)*U[2:n,]
Y <- W/apply(W,MARGIN=1,FUN=function(x) sqrt(x[1]^2+x[2]^2))
## No test: 
dependogram(Y,vecd.ou.p=3,N=10,B=20,alpha=0.05,display=TRUE,graphics=TRUE)
## End(No test)



