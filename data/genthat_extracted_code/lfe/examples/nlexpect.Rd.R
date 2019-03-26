library(lfe)


### Name: nlexpect
### Title: Compute expectation of a function of the coefficients.
### Aliases: nlexpect

### ** Examples


N <- 100
x1 <- rnorm(N)
# make some correlation
x2 <- 0.1*rnorm(N) + 0.1*x1
y <- 0.1*x1 + x2 + rnorm(N)
summary(est <- felm(y ~ x1 + x2))
pt1 <- coef(est)['x1']
pt2 <- coef(est)['x2']
# expected values of coefficients, should match the summary
# and variance, i.e. square of standard errors in the summary
nlexpect(est, quote(c(x1=x1,x2=x2,var=c((x1-pt1)^2,(x2-pt2)^2))))
## No test: 
# the covariance matrix:
nlexpect(est, tcrossprod(as.matrix(c(x1-pt1,x2-pt2))))
## End(No test)
#Wald test of single variable
waldtest(est, ~x1)['p.F']
# the same with nlexpect, i.e. probability for observing abs(x1)>abs(pt1) conditional
# on E(x1) = 0.
nlexpect(est, (x1-pt1)^2 > pt1^2, tol=1e-7, vectorize=TRUE)
# which is the same as
2*nlexpect(est, x1*sign(pt1) < 0)

# Here's a multivalued, vectorized example
nlexpect(est, rbind(a=x1*x2 < pt1, b=x1*x2 > 0), vectorize=TRUE)
## No test: 

# Non-linear test:

# A simple one, what's the probability that product x1*x2 is between 0 and |E(x1)|?
nlexpect(est, x1*x2 > 0 & x1*x2 < abs(pt1), vectorize=TRUE)
# Then a more complicated one with the expected value of a polynomal in the coefficients
f <- function(x) c(poly=x[['x1']]*(6*x[['x1']]-x[['x2']]^2))
# This is the linearized test:
waldtest(est, f)['p.F']
# In general, for a function f, the non-linear Wald test is something like
# the following:
# expected value of function
Ef <- nlexpect(est, f, coefs=c('x1','x2'))
# point value of function
Pf <- f(c(pt1,pt2))
# similar to a Wald test, but non-linear:
nlexpect(est, function(x) (f(x)-Ef)^2 > Pf^2, c('x1','x2'), vectorize=TRUE)
# one-sided
nlexpect(est, function(x) f(x)-Ef > abs(Pf), c('x1','x2'), vectorize=TRUE)
# other sided
nlexpect(est, function(x) f(x)-Ef < -abs(Pf), c('x1','x2'), vectorize=TRUE)
## End(No test)




