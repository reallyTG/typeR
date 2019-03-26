library(AER)


### Name: MSCISwitzerland
### Title: MSCI Switzerland Index
### Aliases: MSCISwitzerland
### Keywords: datasets

### ** Examples

data("MSCISwitzerland", package = "AER")

## p.190, Fig. 7.6
dlmsci <- 100 * diff(log(MSCISwitzerland))
plot(dlmsci)

dlmsci9501 <- window(dlmsci, end = as.Date("2001-12-31"))

## Figure 7.7
plot(acf(dlmsci9501^2, lag.max = 200, na.action = na.exclude),
  ylim = c(-0.1, 0.3), type = "l")


## GARCH(1,1) model, p.190, eq. (7.60)

## standard errors using first derivatives (as apparently used by Franses et al.)
library("tseries")
msci9501_g11 <- garch(zooreg(dlmsci9501), trace = FALSE)
summary(msci9501_g11)

## standard errors using second derivatives
library("fGarch")
msci9501_g11a <- garchFit( ~ garch(1,1), include.mean = FALSE,
  data = dlmsci9501, trace = FALSE)
summary(msci9501_g11a)

round(msci9501_g11a@fit$coef, 3)
round(msci9501_g11a@fit$se.coef, 3)

## Fig. 7.8, p.192
plot(msci9501_g11a, which = 2)
abline(h = sd(dlmsci9501))


## TGARCH model (also known as GJR-GARCH model), p. 191, eq. (7.61)
msci9501_tg11 <- garchFit( ~ aparch(1,1), include.mean = FALSE,
  include.delta = FALSE, delta = 2, data = dlmsci9501, trace = FALSE)
summary(msci9501_tg11)

## GJR form using reparameterization as given by Ding et al. (1993, pp. 100-101)
coef(msci9501_tg11)["alpha1"] * (1 - coef(msci9501_tg11)["gamma1"])^2  ## alpha*
4 * coef(msci9501_tg11)["alpha1"] * coef(msci9501_tg11)["gamma1"]      ## gamma*

## GARCH and GJR-GARCH with rugarch
library("rugarch")
spec_g11 <- ugarchspec(variance.model = list(model = "sGARCH"),
  mean.model = list(armaOrder = c(0,0), include.mean = FALSE))
msci9501_g11b <- ugarchfit(spec_g11, data = dlmsci9501)
msci9501_g11b

spec_gjrg11 <- ugarchspec(variance.model = list(model = "gjrGARCH", garchOrder = c(1,1)),
  mean.model = list(armaOrder = c(0, 0), include.mean = FALSE))
msci9501_gjrg11 <- ugarchfit(spec_gjrg11, data = dlmsci9501)
msci9501_gjrg11

round(coef(msci9501_gjrg11), 3)



