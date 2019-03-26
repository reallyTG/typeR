library(mixAK)


### Name: rRotationMatrix
### Title: Random rotation matrix
### Aliases: rRotationMatrix C_RotationMatrix_R
### Keywords: array distribution multivariate

### ** Examples

P <- rRotationMatrix(n=1, dim=5)
print(P)
round(P %*% t(P), 10)
round(t(P) %*% P, 10)
det(P)

n <- 10
P <- rRotationMatrix(n=n, dim=5)
for (i in 1:3){
  cat(paste("*** i=", i, "\n", sep=""))
  print(P[[i]])
  print(round(P[[i]] %*% t(P[[i]]), 10))
  print(round(t(P[[i]]) %*% P[[i]], 10))
  print(det(P[[i]]))
}



