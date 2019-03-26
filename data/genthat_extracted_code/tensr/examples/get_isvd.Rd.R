library(tensr)


### Name: get_isvd
### Title: Calculate the incredible SVD (ISVD).
### Aliases: get_isvd
### Keywords: decompositions

### ** Examples

#Generate random data.
p <- c(4,4,4)
X <- array(stats::rnorm(prod(p)), dim = p)

#Calculate HOLQ, then ISVD
holq_x <- holq(X)
isvd_x <- get_isvd(holq_x)
l <- isvd_x$l
U <- isvd_x$U
D <- isvd_x$D
V <- isvd_x$V

#Recover X
trim(X - l * atrans(atrans(V, D), U))

#V is scaled all-orthonormal
trim(mat(V, 1) %*% t(mat(V, 1)), epsilon = 10^-5)

trim(mat(V, 2) %*% t(mat(V, 2)), epsilon = 10^-5)

trim(mat(V, 3) %*% t(mat(V, 3)), epsilon = 10^-5)



