library(stcov)


### Name: haff_eig
### Title: Stein/Haff's ordered eigenvalue estimates
### Aliases: haff_eig

### ** Examples

p <- 5
n <- 10
S <- rWishart(1, n, diag(p))[,,1]
l <- eigen(S)$val
haff_eig(l, n)



