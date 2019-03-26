library(CKLRT)


### Name: omniRLRT_fast
### Title: Composite kernel machine regression based restricted likelihood
###   ratio test
### Aliases: omniRLRT_fast

### ** Examples

set.seed(6)
n = 50 # the number of observations
X = rnorm(n) # the other covariates
p = 2 # two snp in a gene will be simulated
G = runif(n*p)< 0.5
G = G + runif(n*p) < 0.5
G = matrix(G, n,p) #genetic matrix
E = (runif(n) < 0.5)^2 #enviroment effect
y = rnorm(n) + G[,1] * 0.3 #observations
omniRLRT_fast(y, X =  cbind(X, E),K1 = G %*% t(G),K2 = (G*E) %*% t(G * E))



