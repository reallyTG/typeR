library(pracma)


### Name: householder
### Title: Householder Reflections
### Aliases: householder
### Keywords: array

### ** Examples

##  QR decomposition
A <- matrix(c(0,-4,2, 6,-3,-2, 8,1,-1), 3, 3, byrow=TRUE)
S <- householder(A)
(Q <- S$Q); (R <- S$R)
Q %*% R  # = A

##  Solve an overdetermined linear system of equations
A <- matrix(c(1:8,7,4,2,3,4,2,2), ncol=3, byrow=TRUE)
S <- householder(A); Q <- S$Q; R <- S$R
m <- nrow(A); n <- ncol(A)
b <- rep(6, 5)

x <- numeric(n)
b <- t(Q) %*% b
x[n] <- b[n] / R[n, n]
for (k in (n-1):1)
    x[k] <- (b[k] - R[k, (k+1):n] %*% x[(k+1):n]) / R[k, k]
qr.solve(A, rep(6, 5)); x



