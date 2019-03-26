library(pacbpred)


### Name: pacbpred
### Title: pacbpred
### Aliases: pacbpred
### Keywords: nonlinear pac-bayesian prediction

### ** Examples

ndata <- 100
ntrain <- 80
ntest <- ndata - ntrain
p <- 10
Y <- numeric(ndata)
X <- matrix(nr = ndata, nc = p, data = 2*runif(n = ndata*p) - 1)
for(i in 1:ndata)
  {
    Y[i] <- X[i,1]^3+sin(pi*X[i,2])
  }

Xtrain <- X[1:ntrain,]
Xtest <- X[(ntrain+1):ndata,]
Ytrain <- Y[1:ntrain]
Ytest <- Y[(ntrain+1):ndata]

niter <- 100
cst <- Inf
alpha <- .1
sigma2 <- .1
delta <- ntrain/2

res <- pacbpred(niter = niter, Xtrain = Xtrain, Xtest = Xtest, Y =
Ytrain, cst = cst,
sigma2 = sigma2, delta = delta, alpha = alpha)

print(cbind(res$predict,Ytest))




