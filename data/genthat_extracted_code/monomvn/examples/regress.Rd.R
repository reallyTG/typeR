library(monomvn)


### Name: regress
### Title: Switch function for least squares and parsimonious monomvn
###   regressions
### Aliases: regress
### Keywords: regression

### ** Examples

## following the lars diabetes example
data(diabetes)
attach(diabetes)

## Ordinary Least Squares regression
reg.ols <- regress(x, y)

## Lasso regression
reg.lasso <- regress(x, y, method="lasso")

## partial least squares regression
reg.plsr <- regress(x, y, method="plsr")

## ridge regression
reg.ridge <- regress(x, y, method="ridge")

## compare the coefs
data.frame(ols=reg.ols$b, lasso=reg.lasso$b,
           plsr=reg.plsr$b, ridge=reg.ridge$b)

## summarize the posterior distribution of lambda2 and s2
detach(diabetes)



