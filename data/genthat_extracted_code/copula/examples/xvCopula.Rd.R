library(copula)


### Name: xvCopula
### Title: Model (copula) selection based on 'k'-fold cross-validation
### Aliases: xvCopula
### Keywords: models multivariate

### ** Examples

## Don't show: 
set.seed(47)
## End(Don't show)
## A two-dimensional data example ----------------------------------
x <- rCopula(200, claytonCopula(3))

## No test: 
## Model (copula) selection -- takes time: each fits 200 copulas to 199 obs.
xvCopula(gumbelCopula(), x)
xvCopula(frankCopula(), x)
xvCopula(joeCopula(), x)
xvCopula(claytonCopula(), x)
xvCopula(normalCopula(), x)
xvCopula(tCopula(), x)
xvCopula(plackettCopula(), x)
## End(No test)

## The same with 5-fold cross-validation [to save time ...]
set.seed(1) # k-fold is random (for k < n) !
xvCopula(gumbelCopula(),  x, k=5)
xvCopula(frankCopula(),   x, k=5)
xvCopula(joeCopula(),     x, k=5)
xvCopula(claytonCopula(), x, k=5)
xvCopula(normalCopula(),  x, k=5)
xvCopula(tCopula(),       x, k=5)
xvCopula(plackettCopula(),x, k=5)



