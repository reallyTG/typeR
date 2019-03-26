library(PEIP)

A <- matrix(1:15, nrow=5,ncol=3)
 B <- matrix(c(8,1,6,
               3,5,7,
               4,9,2), nrow=3, byrow=TRUE)

z <- GSVD(A,B)
C <- z$C
S <- z$S
sqrt(diag(t(C) %*% C)) / sqrt(diag(t(S) %*% S))
testA = A - z$U %*% C %*% t(z$X)
testB = B - z$V %*% S %*% t(z$X)

print(testA)
print(testB)


