library(rstiefel)


### Name: lineSearch
### Title: A curvilinear search on the Stiefel manifold (Wen and Yin 2013,
###   Algo 1)
### Aliases: lineSearch

### ** Examples

N <- 10
P <- 2
M <- diag(10:1)
F <- function(V) { - sum(diag(t(V) %*% M %*% V)) }
dF <- function(V) { - 2*M %*% V }
X <- rustiefel(N, P)
res <- lineSearch(F, dF, X, rho1=0.1, rho2=0.9, tauStart=1)




