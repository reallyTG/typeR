library(tensr)


### Name: hosvd
### Title: Calculate the (truncated) higher-order SVD (HOSVD).
### Aliases: hosvd
### Keywords: decompositions

### ** Examples

#Generate random data.
p <- c(2, 3, 4)
X <- array(stats::rnorm(prod(p)), dim = p)

#Calculate HOSVD.
hosvd_x <- hosvd(X)
S <- hosvd_x$S
U <- hosvd_x$U

#Recover X.
trim(X - atrans(S, U))

#S is all-orthogonal.
trim(mat(S, 1) %*% t(mat(S, 1)))
trim(mat(S, 2) %*% t(mat(S, 2)))
trim(mat(S, 3) %*% t(mat(S, 3)))



