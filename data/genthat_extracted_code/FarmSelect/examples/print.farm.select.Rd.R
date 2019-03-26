library(FarmSelect)


### Name: print.farm.select
### Title: Summarize and print the results of the model selection
### Aliases: print.farm.select

### ** Examples

set.seed(100)
P = 200 #dimension
N = 50 #samples
K = 3 #nfactors
Q = 3 #model size
Lambda = matrix(rnorm(P*K, 0,1), P,K)
F = matrix(rnorm(N*K, 0,1), N,K)
U = matrix(rnorm(P*N, 0,1), P,N)
X = Lambda%*%t(F)+U
X = t(X)
beta_1 = rep(5,Q)
beta = c(beta_1, rep(0,P-Q))
eps = rt(N, 2.5)
Y = X%*%beta+eps

##with default options
output = farm.select(X,Y)
output



