## ----gh-installation, eval = FALSE---------------------------------------
#  install.packages("devtools")
#  devtools::install_github("kbose28/FarmSelect")
#  library(FarmSelect)

## ------------------------------------------------------------------------
library(FarmSelect)
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
beta_1 = rep(5, Q)
beta = c(beta_1, rep(0,P-Q))
eps = rt(N, 2.5)

Y = X%*%beta+eps 
output = farm.select(X,Y) #robust, no cross-validation
output

## ------------------------------------------------------------------------
names(output)
output$beta.chosen
output$coef.chosen

## ------------------------------------------------------------------------
farm.select(X,Y, loss = "mcp", K.factors = 10, verbose=FALSE)

## ------------------------------------------------------------------------
##examples of other robustification options
output = farm.select(X,Y,robust = FALSE, verbose=FALSE) #non-robust
output = farm.select(X,Y, tau = 3, verbose=FALSE) #robust, no cross-validation, specified tau
#output = farm.select(X,Y, cv = TRUE) #robust, cross-validation, LONG RUNNING!!

## ------------------------------------------------------------------------
output = farm.res(X, verbose=FALSE)
names(output)

## ------------------------------------------------------------------------
output = farm.res(X, K.factors  = 30, verbose=FALSE)

## ------------------------------------------------------------------------
set.seed(100)
P = 400 #dimension
N = 300 #samples
K = 3 #nfactors
Q = 3 #model size
Lambda = matrix(rnorm(P*K, 0,1), P,K)
F = matrix(rnorm(N*K, 0,1), N,K)
U = matrix(rnorm(P*N, 0,1), P,N)
X = Lambda%*%t(F)+U
X = t(X)
beta_1 = rep(5, Q)
beta = c(beta_1, rep(0,P-Q))
eps = rnorm(N)

Prob = 1/(1+exp(-X%*%beta))
Y = rbinom(N, 1, Prob)
output = farm.select(X,Y, lin.reg=FALSE, eps=1e-3)

