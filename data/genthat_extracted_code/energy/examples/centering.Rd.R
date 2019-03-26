library(energy)


### Name: centering distance matrices
### Title: Double centering and U-centering
### Aliases: Ucenter Dcenter U_center D_center
### Keywords: multivariate

### ** Examples

 x <- iris[1:10, 1:4]
 dx <- dist(x)
 Dx <- as.matrix(dx)
 M <- U_center(Dx)

 all.equal(M, U_center(M))     #idempotence
 all.equal(M, D_center(M))     #invariance



