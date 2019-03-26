library(grpSLOPE)


### Name: sigma
### Title: Extract (estimated) noise level
### Aliases: sigma sigma.grpSLOPE

### ** Examples

set.seed(1)
A   <- matrix(rnorm(100^2), 100, 100)
grp <- rep(rep(1:20), each = 5)
b   <- c(rep(1, 20), rep(0, 80))
y   <- A %*% b + rnorm(10) 
# model with unknown noise level
result <- grpSLOPE(X = A, y = y, group = grp, fdr = 0.1)
sigma(result)
# [1] 0.6505558
# model with known noise level
result <- grpSLOPE(X = A, y = y, group = grp, fdr = 0.1, sigma = 1)
sigma(result)
# [1] 1




