library(geigen)


### Name: gsvd.Auxiliaries
### Title: Extract the R, D1, D2 matrices from a gsvd object
### Aliases: gsvd.aux gsvd.R gsvd.oR gsvd.D1 gsvd.D2
### Keywords: algebra array

### ** Examples

A <- matrix(c(1,2,3,3,2,1,4,5,6,7,8,8), nrow=2, byrow=TRUE)
B <- matrix(1:18,byrow=TRUE, ncol=6)
A
B

z <- gsvd(A,B)
z

R <- gsvd.R(z)
oR <- gsvd.oR(z)
D1 <- gsvd.D1(z); D2 <- gsvd.D2(z)
R;oR
D1;D2



