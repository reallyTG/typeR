library(cglasso)


### Name: scale.datacggm
### Title: Scaling and Centering of "datacggm" Objects
### Aliases: scale.datacggm
### Keywords: array

### ** Examples

set.seed(123)

n <- 100L
p <- 3L
mu <- rep(1L, p)
X <- rdatacggm(n = n, mu = mu, probr = 0.05, probl = 0.05)
centered.X <- scale(X)
centered.X
attr(centered.X, "scaled:center")
attr(centered.X, "scaled:scale")



