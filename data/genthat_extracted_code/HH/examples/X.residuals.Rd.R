library(HH)


### Name: X.residuals
### Title: Residuals from the regression of each column of a data.frame
###   against all the other columns.
### Aliases: X.residuals X.residuals.default X.residuals.formula
###   X.residuals.lm
### Keywords: regression

### ** Examples

data(usair)
usair$lnSO2 <- log(usair$SO2)
usair$lnmfg <- log(usair$mfgfirms)
usair$lnpopn <- log(usair$popn)

usair.lm <- lm(lnSO2 ~ temp + lnmfg + wind + precip, data=usair)
X.residuals(usair.lm)

X.residuals(lnSO2 ~ temp + lnmfg + wind + precip, data=usair)

X.residuals(usair)

X.residuals(usair, y.name="lnSO2")



