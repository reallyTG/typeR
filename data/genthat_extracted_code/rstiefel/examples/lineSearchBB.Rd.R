library(rstiefel)


### Name: lineSearchBB
### Title: A curvilinear search on the Stiefel manifold with BB steps (Wen
###   and Yin 2013, Algo 2) This is based on the line search algorithm
###   described in (Zhang and Hager, 2004)
### Aliases: lineSearchBB

### ** Examples

N <- 10
P <- 2
M <- diag(10:1)
F <- function(V) { - sum(diag(t(V) %*% M %*% V)) }
dF <- function(V) { - 2*M %*% V }
Xprev <- rustiefel(N, P)
G_xprev <- dF(Xprev)
X <- rustiefel(N, P)
G_x <- dF(X)
Xprev <- dF(X)
res <- lineSearchBB(F, X, Xprev, G_x, G_xprev, rho=0.1, C=F(X))




