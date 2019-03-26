library(FarmSelect)


### Name: farm.res
### Title: Adjusting a data matrix for underlying factors
### Aliases: farm.res

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
output = farm.res(X) #default options
output$nfactors
output = farm.res(X, K.factors = 10) #inputting factors
names(output) #list of output



