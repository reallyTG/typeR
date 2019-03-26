library(lavaSearch2)


### Name: summary2
### Title: Summary with Small Sample Correction
### Aliases: summary2 summary2.lm summary2.gls summary2.lme summary2.lvmfit
###   summary2.lm2 summary2.gls2 summary2.lme2 summary2.lvmfit2

### ** Examples

m <- lvm(Y~X1+X2)
set.seed(10)
d <- lava::sim(m, 2e1)

## Gold standard
summary(lm(Y~X1+X2, d))$coef

## gls models
library(nlme)
e.gls <- gls(Y~X1+X2, data = d, method = "ML")
summary(e.gls)$tTable
sCorrect(e.gls, cluster = 1:NROW(d)) <- FALSE ## no small sample correction
summary2(e.gls)$tTable

sCorrect(e.gls, cluster = 1:NROW(d)) <- TRUE ## small sample correction
summary2(e.gls)$tTable

## lvm models
e.lvm <- estimate(m, data = d)
summary(e.lvm)$coef

sCorrect(e.lvm) <- FALSE ## no small sample correction
summary2(e.lvm)$coef

sCorrect(e.lvm) <- TRUE ## small sample correction
summary2(e.lvm)$coef




