library(tensorBF)


### Name: tensorBF
### Title: Bayesian Factorization of a Tensor
### Aliases: tensorBF

### ** Examples

#Data generation
K <- 2
X <- matrix(rnorm(20*K),20,K)
W <- matrix(rnorm(25*K),25,K)
U <- matrix(rnorm(3*K),3,K)
Y = 0
for(k in 1:K) Y <- Y + outer(outer(X[,k],W[,k]),U[,k])
 Y <- Y + array(rnorm(20*25*3,0,0.25),dim=c(20,25,3))

#Run the method with default options
## Not run: res2 <- tensorBF(Y=Y)

#Run the method with K=3 and iterations=1000
## Not run: opts <- getDefaultOpts(); opts$iter.burnin = 1000
## Not run: res1 <- tensorBF(Y=Y,K=3,opts=opts)

#Vary the user defined expected proportion of noise variance
#explained. c(0.2,1) represents 0.2 as the noise proportion
#and confidence of 1
## Not run: res3 <- tensorBF(Y=Y,noiseProp=c(0.2,1))




