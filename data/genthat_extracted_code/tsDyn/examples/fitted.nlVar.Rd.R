library(tsDyn)


### Name: fitted.nlVar
### Title: fitted method for objects of class nlVar, i.e. VAR and VECM
###   models.
### Aliases: fitted.nlVar fitted
### Keywords: regression

### ** Examples



## estimate models
data(barry)

ve <- VECM(barry, lag=2)
va <- lineVar(barry, lag=1)
va_diff <- lineVar(barry, lag=1, I="diff")
va_ADF <- lineVar(barry, lag=1, I="ADF")


## get fitted values:
tail(fitted(ve))
tail(fitted(ve, level="original"))

tail(fitted(va))
tail(fitted(object=va, level="original"))

tail(fitted(va_diff))
tail(fitted(object=va_diff, level="original"))

tail(fitted(va_ADF))
tail(fitted(object=va_ADF, level="original"))





