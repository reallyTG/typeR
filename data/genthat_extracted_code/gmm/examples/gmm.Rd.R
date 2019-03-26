library(gmm)


### Name: gmm
### Title: Generalized method of moment estimation
### Aliases: gmm gmmWithConst evalGmm

### ** Examples


## CAPM test with GMM
data(Finance)
r <- Finance[1:300, 1:10]
rm <- Finance[1:300, "rm"]
rf <- Finance[1:300, "rf"]

z <- as.matrix(r-rf)
t <- nrow(z)
zm <- rm-rf
h <- matrix(zm, t, 1)
res <- gmm(z ~ zm, x = h)
summary(res)

## linear tests can be performed using linearHypothesis from the car package
## The CAPM can be tested as follows:

library(car)
linearHypothesis(res,cbind(diag(10),matrix(0,10,10)),rep(0,10))

# The CAPM of Black
g <- function(theta, x) {
	e <- x[,2:11] - theta[1] - (x[,1] - theta[1]) %*% matrix(theta[2:11], 1, 10)
	gmat <- cbind(e, e*c(x[,1]))
	return(gmat) }

x <- as.matrix(cbind(rm, r))
res_black <- gmm(g, x = x, t0 = rep(0, 11))

summary(res_black)$coefficients


## APT test with Fama-French factors and GMM

f1 <- zm
f2 <- Finance[1:300, "hml"] 
f3 <- Finance[1:300, "smb"] 
h <- cbind(f1, f2, f3)
res2 <- gmm(z ~ f1 + f2 + f3, x = h)
coef(res2)
summary(res2)$coefficients

## Same result with x defined as a formula:

res2 <- gmm(z ~ f1 + f2 + f3, ~ f1 + f2 + f3)
coef(res2)

## The following example has been provided by Dieter Rozenich (see details).
# It generates normal random numbers and uses the GMM to estimate 
# mean and sd.
#-------------------------------------------------------------------------------
# Random numbers of a normal distribution
# First we generate normally distributed random numbers and compute the two parameters:
n <- 1000
x <- rnorm(n, mean = 4, sd = 2)
# Implementing the 3 moment conditions
g <- function(tet, x)
        {
        m1 <- (tet[1] - x)
        m2 <- (tet[2]^2 - (x - tet[1])^2)
        m3 <- x^3 - tet[1]*(tet[1]^2 + 3*tet[2]^2)
        f <- cbind(m1, m2, m3)
        return(f)
        }
# Implementing the jacobian
Dg <- function(tet, x)
        {
        jacobian <- matrix(c( 1, 2*(-tet[1]+mean(x)), -3*tet[1]^2-3*tet[2]^2,0, 2*tet[2],
			   -6*tet[1]*tet[2]), nrow=3,ncol=2)
        return(jacobian)
        }
# Now we want to estimate the two parameters using the GMM.
gmm(g, x, c(0, 0), grad = Dg)

# Two-stage-least-squares (2SLS), or IV with iid errors.
# The model is:
# Y(t) = b[0] + b[1]C(t) + b[2]Y(t-1) + e(t)
# e(t) is an MA(1)
# The instruments are Z(t)={1 C(t) y(t-2) y(t-3) y(t-4)}

getdat <- function(n) {
e <- arima.sim(n,model=list(ma=.9))
C <- runif(n,0,5)
Y <- rep(0,n)
Y[1] = 1 + 2*C[1] + e[1]
for (i in 2:n){
Y[i] = 1 + 2*C[i] + 0.9*Y[i-1] + e[i]
}
Yt <- Y[5:n]
X <- cbind(1,C[5:n],Y[4:(n-1)])
Z <- cbind(1,C[5:n],Y[3:(n-2)],Y[2:(n-3)],Y[1:(n-4)]) 
return(list(Y=Yt,X=X,Z=Z))
}

d <- getdat(5000)
res4 <- gmm(d$Y~d$X-1,~d$Z-1,vcov="iid")
res4

### Examples with equality constraint 
######################################

# Random numbers of a normal distribution

## Not run:
# The following works but produces warning message because the dimension of coef is 1
# Brent should be used

# without named vector
# Method Brent is used because the problem is now one-dimensional
gmm(g, x, c(4, 0), grad = Dg, eqConst=1, method="Brent", lower=-10,upper=10)
# with named vector
gmm(g, x, c(mu=4, sig=2), grad = Dg, eqConst="sig", method="Brent", lower=-10,upper=10)

## End(Not run)

gmm(g, x, c(4, 0), grad = Dg, eqConst=1,method="Brent",lower=0,upper=6)
gmm(g, x, c(mu=4, sig=2), grad = Dg, eqConst="sig",method="Brent",lower=0,upper=6)

# Example with formula
# first coef = 0 and second coef = 1
# Only available for one dimensional yt

z <- z[,1]
res2 <- gmm(z ~ f1 + f2 + f3, ~ f1 + f2 + f3, eqConst = matrix(c(1,2,0,1),2,2))
res2

# CUE with starting t0 requires eqConst to be a vector

res3 <- gmm(z ~ f1 + f2 + f3, ~ f1 + f2 + f3, t0=c(0,1,.5,.5), type="cue", eqConst = c(1,2))
res3

### Examples with equality constraints, where the constrained coefficients is used to compute
### the covariance matrix.
### Useful when some coefficients have been estimated before, they are just identified in GMM 
### and don't need to be re-estimated.
### To use with caution because the covariance won't be valid if the coefficients do not solve
### the GMM FOC.
######################################

res4 <- gmm(z ~ f1 + f2 + f3, ~ f1 + f2 + f3, t0=c(0,1,.5,.5), eqConst = c(1,2), 
  	    eqConstFullVcov=TRUE)
summary(res4)


### Examples with equality constraint using gmmWithConst
###########################################################

res2 <- gmm(z ~ f1 + f2 + f3, ~ f1 + f2 + f3)
gmmWithConst(res2,c("f2","f3"),c(.5,.5))
gmmWithConst(res2,c(2,3),c(.5,.5))

## Creating an object without estimation for a fixed parameter vector
###################################################################

res2_2 <- evalGmm(z ~ f1 + f2 + f3, ~ f1 + f2 + f3,
                  t0=res2$coefficients, tetw=res2$coefficients)
summary(res2_2)




