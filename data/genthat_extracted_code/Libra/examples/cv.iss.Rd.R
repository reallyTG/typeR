library(Libra)


### Name: cv.iss
### Title: CV for ISS
### Aliases: cv.iss
### Keywords: Cross-validation

### ** Examples

#Examples in the reference paper
library(MASS)
n = 200;p = 100;k = 30;sigma = 1
Sigma = 1/(3*p)*matrix(rep(1,p^2),p,p)
diag(Sigma) = 1
A = mvrnorm(n, rep(0, p), Sigma)
u_ref = rep(0,p)
supp_ref = 1:k
u_ref[supp_ref] = rnorm(k)
u_ref[supp_ref] = u_ref[supp_ref]+sign(u_ref[supp_ref])
b = as.vector(A%*%u_ref + sigma*rnorm(n))
cv.iss(A,b,intercept = FALSE,normalize = FALSE)




