library(MRS)


### Name: mrs
### Title: Multi Resolution Scanning
### Aliases: mrs

### ** Examples

set.seed(1)
n = 20
p = 2
X = matrix(c(runif(p*n/2),rbeta(p*n/2, 1, 4)), nrow=n, byrow=TRUE)
G = c(rep(1,n/2), rep(2,n/2))
ans = mrs(X=X, G=G)



