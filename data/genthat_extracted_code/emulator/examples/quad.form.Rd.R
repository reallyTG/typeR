library(emulator)


### Name: quad.form
### Title: Evaluate a quadratic form efficiently
### Aliases: quad.form quad.form.inv quad.3form quad.tform quad.3tform
###   quad.tform.inv quad.diag quad.tdiag cprod tcprod ht
### Keywords: array

### ** Examples

jj <- matrix(rnorm(80),20,4)
M <- crossprod(jj,jj)
M.lower <- t(chol(M))
x <- matrix(rnorm(8),4,2)

jj.1 <- t(x) %*% M %*% x
jj.2 <- quad.form(M,x)
jj.3 <- quad.form(M.lower,x,chol=TRUE)
print(jj.1)
print(jj.2)
print(jj.3)




## Make two Hermitian positive-definite matrices:
L <- matrix(c(1,0.1i,-0.1i,1),2,2)
LL <- diag(11)
LL[2,1] <- -(LL[1,2] <- 0.1i)


z <- t(latin.hypercube(11,2,complex=TRUE))


quad.diag(L,z)     # elements real because L is HPD
quad.tdiag(LL,z)   # ditto




## Now consider accuracy:
quad.form(solve(M),x) - quad.form.inv(M,x)  # should be zero
quad.form(M,x) - quad.tform(M,t(x))         # should be zero
quad.diag(M,x) - diag(quad.form(M,x))       # should be zero
diag(quad.form(L,z))   - quad.diag(L,z)     # should be zero
diag(quad.tform(LL,z)) - quad.tdiag(LL,z)   # should be zero



