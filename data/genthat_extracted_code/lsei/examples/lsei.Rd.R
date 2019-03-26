library(lsei)


### Name: lsei
### Title: Least Squares Solution under Equality and Inequality Constraints
### Aliases: lsei lsi ldp qp
### Keywords: array algebra

### ** Examples

beta = c(rnorm(2), 1)
beta[beta<0] = 0
beta = beta / sum(beta)
a = matrix(rnorm(18), ncol=3)
b = a %*% beta + rnorm(3,sd=.1)
c = t(rep(1, 3))
d = 1
e = diag(1,3)
f = rep(0,3)
lsei(a, b)                        # under no constraint
lsei(a, b, c, d)                  # under eq. constraints
lsei(a, b, e=e, f=f)              # under ineq. constraints
lsei(a, b, c, d, e, f)            # under eq. and ineq. constraints
lsei(a, b, rep(1,3), 1, lower=0)  # same solution
q = crossprod(a)
p = -drop(crossprod(b, a))
qp(q, p, rep(1,3), 1, lower=0)    # same solution

## Example from Lawson and Hanson (1974), p.170
a = cbind(c(.25,.5,.5,.8),rep(1,4))
b = c(.5,.6,.7,1.2)
e = cbind(c(1,0,-1),c(0,1,-1))
f = c(0,0,-1)
lsi(a, b, e, f)      # Solution: 0.6213152 0.3786848

## Example from Lawson and Hanson (1974), p.171:
e = cbind(c(-.207,-.392,.599), c(2.558, -1.351, -1.206))
f = c(-1.3,-.084,.384)
ldp(e, f)            # Solution: 0.1268538 -0.2554018



