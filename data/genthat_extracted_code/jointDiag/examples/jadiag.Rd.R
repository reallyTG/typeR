library(jointDiag)


### Name: jadiag
### Title: Joint Approximate Diagonalization of a set of square, symmetric
###   and real-valued matrices
### Aliases: jadiag
### Keywords: algebra

### ** Examples

# generating diagonal matrices
D <- replicate(30, diag(rchisq(df=1,n=10)), simplify=FALSE)
# Mixing and demixing matrices
B <- matrix(rnorm(100),10,10)
A <- solve(B)
C <- array(NA,dim=c(10,10,30))
for (i in 1:30) C[,,i] <- A %*% D[[i]] %*% t(A)
B_est <- jadiag(C)$B
# B_est should be an approximate of B=solve(A)
B_est %*% A
# close to a permutation matrix (with random scales)



