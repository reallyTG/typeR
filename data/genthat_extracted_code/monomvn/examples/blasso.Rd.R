library(monomvn)


### Name: blasso
### Title: Bayesian Lasso/NG, Horseshoe, and Ridge Regression
### Aliases: blasso bhs bridge
### Keywords: regression

### ** Examples

## following the lars diabetes example
data(diabetes)
attach(diabetes)

## Ordinary Least Squares regression
reg.ols <- regress(x, y)

## Lasso regression
reg.las <- regress(x, y, method="lasso")

## Bayesian Lasso regression
reg.blas <- blasso(x, y)

## summarize the beta (regression coefficients) estimates
plot(reg.blas, burnin=200)
points(drop(reg.las$b), col=2, pch=20)
points(drop(reg.ols$b), col=3, pch=18)
legend("topleft", c("blasso-map", "lasso", "lsr"),
       col=c(2,2,3), pch=c(21,20,18))

## plot the size of different models visited
plot(reg.blas, burnin=200, which="m")

## get the summary
s <- summary(reg.blas, burnin=200)

## calculate the probability that each beta coef != zero
s$bn0

## summarize s2
plot(reg.blas, burnin=200, which="s2")
s$s2

## summarize lambda2
plot(reg.blas, burnin=200, which="lambda2")
s$lambda2


## Not run: 
##D ## fit with Student-t errors
##D ## (~400-times slower due to automatic thinning level)
##D regt.blas <- blasso(x, y, theta=0.1)
##D 
##D ## plotting some information about nu, and quantiles
##D plot(regt.blas, "nu", burnin=200)
##D quantile(regt.blas$nu[-(1:200)], c(0.05, 0.95))
##D 
##D ## Bayes Factor shows strong evidence for Student-t model
##D mean(exp(regt.blas$llik[-(1:200)] - regt.blas$llik.norm[-(1:200)]))
## End(Not run)

## clean up
detach(diabetes)



