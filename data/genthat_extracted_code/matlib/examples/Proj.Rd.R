library(matlib)


### Name: Proj
### Title: Projection of Vector y on columns of X
### Aliases: Proj

### ** Examples

X <- matrix( c(1, 1, 1, 1, 1, -1, 1, -1), 4,2, byrow=TRUE)
y <- 1:4
Proj(y, X[,1])  # project y on unit vector
Proj(y, X[,2])
Proj(y, X)

# orthogonal complements
yp <-Proj(y, X, list=TRUE)
yp$y
P <- yp$P
IP <- diag(4) - P
yc <- c(IP %*% y)
crossprod(yp$y, yc)

# P is idempotent:  P P = P
P %*% P
all.equal(P, P %*% P)



