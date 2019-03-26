library(stcov)


### Name: iso_eig
### Title: Stein's isotonized eigenvalue estimates
### Aliases: iso_eig

### ** Examples

p <- 5
n <- 10
S <- rWishart(1, n, diag(p))[,,1]
l <- eigen(S)$val
iso_eig(l, n)



