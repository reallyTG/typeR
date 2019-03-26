library(docopulae)


### Name: buildf
### Title: Build probability density or mass Function
### Aliases: buildf

### ** Examples

## No test: 
## for an actual use case see examples for param

library(copula)
library(mvtnorm)

## build bivariate normal
margins = function(y, theta) {
    mu = c(theta$mu1, theta$mu2)
    cbind(dnorm(y, mean=mu, sd=1), pnorm(y, mean=mu, sd=1))
}
copula = normalCopula()

# args: function, copula object, parNames
f1 = buildf(margins, TRUE, copula, parNames='alpha1')
f1 # uses theta[['alpha1']] as copula parameter

## evaluate and plot
theta = list(mu1=2, mu2=-3, alpha1=0.4)

y1 = seq(0, 4, length.out=51)
y2 = seq(-5, -1, length.out=51)
v1 = outer(y1, y2, function(z1, z2) apply(cbind(z1, z2), 1, f1, theta))
str(v1)
contour(y1, y2, v1, main='f1', xlab='y1', ylab='y2')

## compare with bivariate normal from mvtnorm
copula@parameters = theta$alpha1
v = outer(y1, y2, function(yy1, yy2)
    dmvnorm(cbind(yy1, yy2), mean=c(theta$mu1, theta$mu2),
                             sigma=getSigma(copula)))
all.equal(v1, v)


## build bivariate pdf with normal margins and Clayton copula
margins = list(list(pdf=quote(dnorm(y[1], theta$mu1, 1)),
                    cdf=quote(pnorm(y[1], theta$mu1, 1))),
               list(pdf=quote(dnorm(y[2], theta$mu2, 1)),
                    cdf=quote(pnorm(y[2], theta$mu2, 1))))
copula = claytonCopula()

# args: list, copula object, parNames
f2 = buildf(margins, TRUE, copula, list(alpha='alpha1'))
f2

## evaluate and plot
theta = list(mu1=2, mu2=-3, alpha1=2)

y1 = seq(0, 4, length.out=51)
y2 = seq(-5, -1, length.out=51)
v2 = outer(y1, y2, function(z1, z2) apply(cbind(z1, z2), 1, f2, theta))
str(v2)
contour(y1, y2, v2, main='f2', xlab='y1', ylab='y2')

## build alternatives
cexpr = substituteDirect(copula@exprdist$pdf,
                         list(alpha=quote(theta$alpha1)))
# args: list, expression
f3 = buildf(margins, TRUE, cexpr) # equivalent to f2
f3

margins = function(y, theta) {
    mu = c(theta$mu1, theta$mu2)
    cbind(dnorm(y, mean=mu, sd=1), pnorm(y, mean=mu, sd=1))
}
# args: function, copula object, parNames
f4 = buildf(margins, TRUE, copula, 'alpha1')
f4

cpdf = function(u, theta) {
    copula@parameters = theta$alpha1
    dCopula(u, copula)
}
# args: function, function
f5 = buildf(margins, TRUE, cpdf) # equivalent to f4
f5

# args: function, copula object
copula@parameters = 2
f6 = buildf(margins, TRUE, copula)
f6 # uses copula@parameters

cpdf = function(u, theta) dCopula(u, copula)
# args: function, function
f7 = buildf(margins, TRUE, cpdf) # equivalent to f6
f7

## compare all
vv = lapply(list(f3, f4, f5, f6, f7), function(f)
    outer(y1, y2, function(z1, z2) apply(cbind(z1, z2), 1, f, theta)))
sapply(vv, all.equal, v2)
## End(No test)



