library(HH)


### Name: vif
### Title: Calculate the Variance Inflation Factor
### Aliases: vif vif.default vif.formula vif.lm
### Keywords: regression

### ** Examples

data(usair)
if.R(s={usair <- usair}, r={})

usair$lnSO2 <- log(usair$SO2)
usair$lnmfg <- log(usair$mfgfirms)
usair$lnpopn <- log(usair$popn)

usair.lm <- lm(lnSO2 ~ temp + lnmfg + wind + precip, data=usair, x=TRUE)

vif(usair.lm)  ## the lm object must be computed with x=TRUE

vif(lnSO2 ~ temp + lnmfg + wind + precip, data=usair)

vif(usair)

vif(usair, y.name="lnSO2")



