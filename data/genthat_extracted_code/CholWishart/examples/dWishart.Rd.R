library(CholWishart)


### Name: dWishart
### Title: Density for Random Wishart Distributed Matrices
### Aliases: dWishart dInvWishart

### ** Examples

set.seed(20180222)
A <- rWishart(1,10,diag(4))[,,1]
A
dWishart(x = A, df = 10,Sigma = diag(4), log=TRUE)
dInvWishart(x = solve(A), df = 10,Sigma = diag(4), log=TRUE)



