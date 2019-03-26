library(matlib)


### Name: SVD
### Title: Singular Value Decomposition of a Matrix
### Aliases: SVD

### ** Examples

C <- matrix(c(1,2,3,2,5,6,3,6,10), 3, 3) # nonsingular, symmetric
C
SVD(C)

# least squares by the SVD
data("workers")
X <- cbind(1, as.matrix(workers[, c("Experience", "Skill")]))
head(X)
y <- workers$Income
head(y)
(svd <- SVD(X))
VdU <- svd$V %*% diag(1/svd$d) %*%t(svd$U)
(b <- VdU %*% y)
coef(lm(Income ~ Experience + Skill, data=workers))



