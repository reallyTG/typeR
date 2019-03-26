library(tensorBF)


### Name: predictTensorBF
### Title: Predict Missing Values using the Bayesian tensor factorization
###   model
### Aliases: predictTensorBF

### ** Examples

#Data generation
## Not run: K <- 2
## Not run: X <- matrix(rnorm(20*K),20,K)
## Not run: W <- matrix(rnorm(30*K),30,K)
## Not run: U <- matrix(rnorm(3*K),3,K)
## Not run: Y = 0
## Not run: for(k in 1:K) Y <- Y + outer(outer(X[,k],W[,k]),U[,k])
## Not run:  Y <- Y + array(rnorm(20*30*3,0,0.25),dim=c(20,30,3))

#insert missing values
## Not run: m.inds = sample(prod(dim(Y)),100)
## Not run: Yobs = Y[m.inds]
## Not run: Y[m.inds] = NA

#Run the method with default options and predict missing values
## Not run: res <- tensorBF(Y)
## Not run: pred = predictTensorBF(Y=Y,res=res)
## Not run: plot(Yobs,pred[m.inds],xlab="obs",ylab="pred",main=round(cor(Yobs,pred[m.inds]),2))



