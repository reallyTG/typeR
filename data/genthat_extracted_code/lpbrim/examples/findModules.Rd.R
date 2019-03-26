library(lpbrim)


### Name: findModules
### Title: Find modules
### Aliases: findModules

### ** Examples

M <- matrix(rbinom(100, 1, 0.3), ncol=10)
M <- M[rowSums(M)>0, colSums(M)>0]
mod <- findModules(M, iter=2, sparse=FALSE)



