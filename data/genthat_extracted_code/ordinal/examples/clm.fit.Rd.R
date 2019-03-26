library(ordinal)


### Name: clm.fit
### Title: Fit Cumulative Link Models
### Aliases: clm.fit clm.fit.default clm.fit.factor
### Keywords: models

### ** Examples


## A simple example:
fm1 <- clm(rating ~ contact + temp, data=wine)
summary(fm1)
## get the model frame containing y and X:
mf1 <- update(fm1, method="design")
names(mf1)
res <- clm.fit(mf1$y, mf1$X) ## invoking the factor method
stopifnot(all.equal(coef(res), coef(fm1)))
names(res)

## Fitting with the default method:
mf1$control$method <- "Newton"
res2 <- clm.fit(mf1)
stopifnot(all.equal(coef(res2), coef(fm1)))




