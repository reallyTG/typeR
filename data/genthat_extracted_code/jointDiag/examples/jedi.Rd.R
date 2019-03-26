library(jointDiag)


### Name: jedi
### Title: Approximate non-orthogonal joint diagonalization of a set of
###   square real-valued matrices
### Aliases: jedi
### Keywords: algebra

### ** Examples

# generating diagonal matrices
D <- replicate(30, diag(rchisq(df=1,n=10)), simplify=FALSE)
# Mixing and demixing matrices
B <- matrix(rnorm(100),10,10)
A <- solve(B)
C <- array(NA,dim=c(10,10,30))
for (i in 1:30) C[,,i] <- A %*% D[[i]] %*% t(A)
A_est <- jedi(C)$A
# A_est should be an approximate of A
B %*% A_est
# close to a permutation matrix (with random scales)



