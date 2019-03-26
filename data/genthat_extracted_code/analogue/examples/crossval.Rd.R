library(analogue)


### Name: crossval
### Title: Cross-validation of palaeoecological transfer function models
### Aliases: crossval crossval.wa crossval.pcr print.crossval
### Keywords: methods

### ** Examples

## Load the Imbrie & Kipp data and
## summer sea-surface temperatures
data(ImbrieKipp)
data(SumSST)
     
## fit the WA model
mod <- wa(SumSST ~., data = ImbrieKipp)
mod

## Leave one out CV
cv.loo <- crossval(mod)
cv.loo

## k-fold CV (k == 10)
cv.kfold <- crossval(mod, method = "kfold", kfold = 10, folds = 1)
cv.kfold

## n k-fold CV (k == 10, n = 10)
cv.nkfold <- crossval(mod, method = "kfold", kfold = 10, folds = 10)
cv.nkfold

## bootstrap with 100 bootstrap samples
cv.boot <- crossval(mod, method = "bootstrap", nboot = 100)
cv.boot

## extract fitted values and residuals
fitted(cv.boot)
resid(cv.boot)

## Principal Components Regression
mpcr <- pcr(SumSST ~., data = ImbrieKipp, ncomp = 10)
crossval(mpcr, method = "kfold", kfold = 10, folds = 2, ncomp = 10)

crossval(mpcr, method = "bootstrap", nboot = 100, ncomp = 10)



