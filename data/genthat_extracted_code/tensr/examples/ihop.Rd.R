library(tensr)


### Name: ihop
### Title: The incredible higher-order polar decomposition (IHOP).
### Aliases: ihop
### Keywords: decompositions

### ** Examples

#Generate random data.
p <- c(2, 3, 4)
X <- array(stats::rnorm(prod(p)), dim = p)

#Calculate IHOP.
ihop_x <- ihop(X)
R <- ihop_x$R
L <- ihop_x$L
sig <- ihop_x$sig

#Reconstruct X
trim(X - sig * atrans(R, L))

#Orthogonality properties
ortho_1 <- t(solve(L[[1]])) %*% mat(R, 1)
trim(ortho_1 %*% t(ortho_1))

ortho_2 <- t(solve(L[[2]])) %*% mat(R, 2)
trim(ortho_2 %*% t(ortho_2))

ortho_3 <- t(solve(L[[3]])) %*% mat(R, 3)
trim(ortho_3 %*% t(ortho_3))



