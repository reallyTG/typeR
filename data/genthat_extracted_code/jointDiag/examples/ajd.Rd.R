library(jointDiag)


### Name: ajd
### Title: Wrapper: Joint approximate diagonalization of a set of matrices
### Aliases: ajd
### Keywords: algebra

### ** Examples

# generating diagonal matrices
D <- replicate(30, diag(rchisq(df=1,n=10)), simplify=FALSE)
# Mixing and demixing matrices
B <- matrix(rnorm(100),10,10)
A <- solve(B)
C <- array(NA,dim=c(10,10,30))
for (i in 1:30) C[,,i] <- A %*% D[[i]] %*% t(A)
ajd(C,method=c("jedi","ffdiag"))



