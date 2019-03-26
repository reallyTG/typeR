library(ramcmc)


### Name: chol_update
### Title: Rank-one Update of Cholesky Decomposition
### Aliases: chol_update

### ** Examples


L <- matrix(c(4,3,0,5), 2, 2)
u <- c(1, 2)
chol_update(L, u)
t(chol(L %*% t(L) + u %*% t(u)))




