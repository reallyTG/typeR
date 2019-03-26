### R code from vignette source 'tsoutliers-intro.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: tsoutliers-intro.Rnw:108-113
###################################################
require("tsoutliers")
resNile2 <- tso(y = Nile, types = c("AO", "LS", "TC"),
  discard.method = "bottom-up", tsmethod = "auto.arima",
  args.tsmethod = list(allowdrift = FALSE, ic = "bic"))
resNile2


