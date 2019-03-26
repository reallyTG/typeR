library(mvnfast)


### Name: dmvt
### Title: Fast computation of the multivariate Student's t density.
### Aliases: dmvt

### ** Examples

N <- 100
d <- 5
mu <- 1:d
df <- 4
X <- t(t(matrix(rnorm(N*d), N, d)) + mu)
tmp <- matrix(rnorm(d^2), d, d)
mcov <- tcrossprod(tmp, tmp)  + diag(0.5, d)
myChol <- chol(mcov)

head(dmvt(X, mu, mcov, df = df), 10)
head(dmvt(X, mu, myChol, df = df, isChol = TRUE), 10)




