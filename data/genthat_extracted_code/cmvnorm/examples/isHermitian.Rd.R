library(cmvnorm)


### Name: isHermitian
### Title: Is a Matrix Hermitian?
### Aliases: isHermitian ishpd zapim
### Keywords: complex

### ** Examples

v <- 2^(1:30)
zapim(v+1i*exp(-v))


ishpd(matrix(c(1,0.1i,-0.1i,1),2,2))   # should be TRUE
isHermitian(matrix(c(1,3i,-3i,1),2,2)) # should be TRUE





