library(Libra)


### Name: cv.lb
### Title: CV for lb
### Aliases: cv.lb
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
cv.lb(A,b,10,1/20,intercept = FALSE,normalize = FALSE)

#Simulated data, binomial case
X <- matrix(rnorm(500*100), nrow=500, ncol=100)
alpha <- c(rep(1,30), rep(0,70))
y <- 2*as.numeric(runif(500)<1/(1+exp(-X %*% alpha)))-1
cv.lb(X,y,kappa=5,alpha=1,family="binomial",
             intercept=FALSE,normalize = FALSE)




