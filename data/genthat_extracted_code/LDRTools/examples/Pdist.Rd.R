library(LDRTools)


### Name: Pdist
### Title: Function to Compute the Distances Between Orthogonal Projection
###   Matrices
### Aliases: Pdist
### Keywords: multivariate

### ** Examples

# Ex.1
X.1 <- tcrossprod(matrix(rnorm(16),ncol=4))
X.2 <- tcrossprod(matrix(rnorm(16),ncol=4))
X.3 <- tcrossprod(matrix(rnorm(16),ncol=4))
U1 <- eigen(X.1)$vectors
U2 <- eigen(X.2)$vectors
U3 <- eigen(X.3)$vectors

PRO <- list(P1=O2P(U1),P2=O2P(U2),P3=O2P(U3))

DIST.MAT<-Pdist(PRO)
str(DIST.MAT)
as.matrix(DIST.MAT)
print(DIST.MAT, diag=TRUE)
print(DIST.MAT, diag=TRUE, upper=TRUE)

PRO2 <- list(O2P(U1),O2P(U2),O2P(U3))
Pdist(PRO2, weights="inverse")

#############################
# Ex.2
a <- c(1,1,rep(0,8))
A <- diag(a)
b <- c(1,1,1,1,rep(0,6))
B <- diag(b)
P.A <- O2P(A[,1:2])
P.B <- O2P(B[,1:4])

proj.list <- list(P.A,P.B)
Pdist(proj.list, weights="constant")
Pdist(proj.list, weights="inverse")
Pdist(proj.list, weights="sq.inverse")




