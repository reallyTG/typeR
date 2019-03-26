library(tensr)


### Name: holq
### Title: Calculate the incredible higher-order LQ decomposition (HOLQ).
### Aliases: holq
### Keywords: decompositions likelihood

### ** Examples

#Genrate random data.
p <- c(2, 3, 4)
X <- array(stats::rnorm(prod(p)), dim = p)

#Calculate HOLQ with unit diagonal on 2nd mode,
#  and diagonal along 3rd mode.
holq_x <- holq(X, mode_ldu = 2, mode_diag = 3)
Z <- holq_x$Z
A <- holq_x$A
sig <- holq_x$sig

#Reconstruct X
trim(X - sig * atrans(Z, A), 10^-5)

#Properties of core
#First mode has orthonormal rows.
trim(mat(Z, 1) %*% t(mat(Z, 1)), 10^-5)

#Second mode has orthogonal rows.
trim(mat(Z, 2) %*% t(mat(Z, 2)), 10^-5)

#Third mode has unit diagonal (up to scale).
diag(mat(Z, 3) %*% t(mat(Z, 3)))



