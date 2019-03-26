library(stcov)


### Name: stein_eig
### Title: Stein's raw (unisotonized) eigenvalue estimates
### Aliases: stein_eig

### ** Examples

p <- 5
n <- 10
S <- rWishart(1, n, diag(p))[,,1]
l <- eigen(S)$val
stein_eig(l, n)



