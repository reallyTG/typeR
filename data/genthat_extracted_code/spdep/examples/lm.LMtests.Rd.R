library(spdep)


### Name: lm.LMtests
### Title: Lagrange Multiplier diagnostics for spatial dependence in linear
###   models
### Aliases: lm.LMtests print.LMtestlist summary.LMtestlist
###   print.LMtestlist.summary
### Keywords: spatial

### ** Examples

data(oldcol)
oldcrime.lm <- lm(CRIME ~ HOVAL + INC, data = COL.OLD)
summary(oldcrime.lm)
res <- lm.LMtests(oldcrime.lm, nb2listw(COL.nb), test=c("LMerr", "LMlag",
  "RLMerr", "RLMlag", "SARMA"))
summary(res)
lm.LMtests(oldcrime.lm, nb2listw(COL.nb))
lm.LMtests(residuals(oldcrime.lm), nb2listw(COL.nb))



