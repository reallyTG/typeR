library(pfa)


### Name: pfa
### Title: Estimates False Discovery Proportion Under Arbitrary Covariance
###   Dependence
### Aliases: pfa.test pfa.gwas
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Example 1: multiple testing with known covariance

require(MASS)
p <- 100
Sigma <- matrix(0.4,p,p)
diag(Sigma)<- 1
mu <- as.vector(c(rep(3,5), rep(0, p-5)))
Z <- mvrnorm(1, mu, Sigma)
RE1 <- pfa.test(Z, Sigma=Sigma,reg="L1")
summary(RE1)

# Example 2: multiple testing with unknown covariance 

n <- 200
p <- 300
K <- 3
mu <- as.vector(c(rep(2,10),rep(0,p-10)))
B <- matrix(runif(K*p, min=-1, max=1), nrow=K)
f <- matrix(rnorm(K*n), nrow=n)
Bf <- f %*% B
X <- matrix(rep(0, n*p), nrow=n)
for (i in 1:n) 
   X[i,] <- mu + Bf[i,] + rnorm(p)
## Not run: RE2 <- pfa.test(X, tval="pval")
## Not run: summary(RE2)

# Example 3: testing the marginal regression coefficients

n <- 100
p <- 300
beta <- as.matrix(c(rep(2, 10), rep(0, p-10)))
X <- matrix(rep(0, n*p), nrow=n)
X[,1:10] <- matrix(rnorm(n*10), nrow=n)
z <- as.matrix(rnorm(n))
y <- as.matrix(rnorm(n))
X[,11:p] <- as.matrix(rnorm(n*(p-10)), nrow=n)
for (i in 11:p) {
    rho1 <- runif(1,min=-0.2,max=0.2)
    rho2 <- runif(1,min=-0.2,max=0.2)
    X[,i] <- X[,i] + z*rho1 + y*rho2 
}
eps <- as.matrix(rnorm(n))
Y <- X %*% beta + eps
## Not run: RE3 <- pfa.gwas(X,Y)
## Not run: summary(RE3)

# Example 4: GWAS on the CCT8 gene

data(CEU)
## Not run: RE4 <- pfa.gwas(CEU$x, CEU$y, t=exp(-seq(1.8,3.6,0.1)), reg="L2")
## Not run: summary(RE4)




