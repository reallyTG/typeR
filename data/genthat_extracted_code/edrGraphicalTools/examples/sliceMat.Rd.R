library(edrGraphicalTools)


### Name: sliceMat
### Title: Slicing matrix computation
### Aliases: sliceMat
### Keywords: nonlinear

### ** Examples
 

#The "SIR-I" method whithout using 'edr'
n <- 500
p <- 5
H <- 10
beta <- c(1, 1, 1, 0, 0)
X <- rmvnorm(n,rep(0,p),diag(p))
eps <- rnorm(n, 0, 10)
Y <- (X %*% beta)^3 + eps
M <- sliceMat(Y,X,H)
hatBeta <- eigen(solve(var(X)) %*% M)$vectors[,1]
cor(hatBeta,beta)^2
 


