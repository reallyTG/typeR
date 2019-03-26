## ----knitup, include = FALSE---------------------------------------------
library(knitr)
require(printr, quietly = TRUE)
set.seed(225452)

## ----eval = FALSE--------------------------------------------------------
#  devtools::install_github("sachsmc/pseval")

## ----eval = FALSE--------------------------------------------------------
#  install.packages("pseval")

## ----setup---------------------------------------------------------------
library(pseval)
library(survival)

## ------------------------------------------------------------------------
set.seed(1492)
fakedata <- generate_example_data(n = 800)
head(fakedata)

## ----psdesign------------------------------------------------------------
binary.ps <- psdesign(data = fakedata, Z = Z, Y = Y.obs, S = S.obs, BIP = BIP)
binary.ps

## ----casecont------------------------------------------------------------
fakedata.cc <- fakedata
missdex <- sample((1:nrow(fakedata.cc))[fakedata.cc$Y.obs == 0], 
       size = floor(sum(fakedata.cc$Y.obs == 0) * .8))
fakedata.cc[missdex, ]$S.obs <- NA
fakedata.cc$weights <- ifelse(fakedata.cc$Y.obs == 1, 1, .2)

## ----casecont2-----------------------------------------------------------
binary.cc <- psdesign(data = fakedata.cc, Z = Z, Y = Y.obs, S = S.obs, 
                      BIP = BIP, weights = weights)

## ----survex--------------------------------------------------------------
surv.ps <- psdesign(data = fakedata, Z = Z, Y = Surv(time.obs, event.obs), S = S.obs, 
                        BIP = BIP, CPV = CPV, BSM = BSM)

## ----inthelp-------------------------------------------------------------
?add_integration

## ----impp----------------------------------------------------------------
binary.ps <- binary.ps + integrate_parametric(S.1 ~ BIP)
binary.ps

## ----imp2----------------------------------------------------------------
binary.ps + integrate_parametric(S.0 ~ BIP)

## ----imp3, eval = FALSE--------------------------------------------------
#  library(splines)
#  binary.ps + integrate_parametric(S.1 ~ BIP^2)
#  binary.ps + integrate_parametric(S.1 ~ bs(BIP, df = 3))
#  binary.ps + integrate_parametric(S.1 ~ BIP + BSM + BSM^2)

## ----riskhelp------------------------------------------------------------
?add_riskmodel

## ----riskbin-------------------------------------------------------------
binary.ps <- binary.ps + risk_binary(model = Y ~ S.1 * Z, D = 50, risk = risk.logit)
binary.ps

## ----est, cache = TRUE---------------------------------------------------
binary.est <- binary.ps + ps_estimate(method = "BFGS")
binary.boot <- binary.est + ps_bootstrap(n.boots = 500, progress.bar = FALSE, 
                            start = binary.est$estimates$par, method = "BFGS")
binary.boot

## ----alltog, eval = FALSE------------------------------------------------
#  binary.est <- psdesign(data = fakedata, Z = Z, Y = Y.obs, S = S.obs, BIP = BIP) +
#    integrate_parametric(S.1 ~ BIP) +
#    risk_binary(model = Y ~ S.1 * Z, D = 50, risk = risk.logit) +
#    ps_estimate(method = "BFGS")

## ----stg, cache = TRUE---------------------------------------------------
calc_STG(binary.boot, progress.bar = FALSE)

## ----summary-------------------------------------------------------------
smary <- summary(binary.boot)

## ----calcrisk------------------------------------------------------------
head(calc_risk(binary.boot, contrast = "TE", n.samps = 20), 3)
head(calc_risk(binary.boot, contrast = function(R0, R1) 1 - R1/R0, n.samps = 20), 3)

## ----plot1, fig.cap = "Plot showing the estimates using the example data, along with confidence bands (CB), and the true treatment efficacy (TE) curve."----
plot(binary.boot, contrast = "TE", lwd = 2)
abline(h = smary$TE.estimates[2], lty = 3)

expit <- function(x) exp(x)/(1 + exp(x))
trueTE <- function(s){
  
  r0 <- expit(-1 - 0 * s)
  r1 <- expit(-1 - .75 * s)
  1 - r1/r0
  
}

rug(binary.boot$augdata$S.1)
curve(trueTE(x), add = TRUE, col = "red")
legend("bottomright", legend = c("estimated TE", "95\\% CB", "marginal TE", "true TE"), 
       col = c("black", "black", "black", "red"), lty = c(1, 2, 3, 1), lwd = c(2, 2, 1, 1))

## ----logrr, echo = -1, fig.cap = "Plot illustrating ways that different risk contrast functions can be plotted. "----
par(mfrow = c(2, 2), mar = c(4, 4, 1, .5))
plot(binary.boot, contrast = "logRR", lwd = 2, col = c("black", "grey75", "grey75"))
plot(binary.boot, contrast = "RR", log = "y", lwd = 2, col = c("black", "grey75", "grey75"))
plot(binary.boot, contrast = "RD", lwd = 2, col = c("black", "grey75", "grey75"))
plot(binary.boot, contrast = "risk", lwd = 2, lty = c(1, 0, 0, 2, 0, 0))
legend("topright", legend = c("R0", "R1"), lty = c(1, 2), lwd = 2)

## ----ve------------------------------------------------------------------
te.est <- calc_risk(binary.boot, CI.type = "pointwise", n.samps = 200)
head(te.est, 3)

## ----plotciag------------------------------------------------------------
plot(binary.boot, contrast = "TE", lwd = 2, CI.type = "band")
sbs <- calc_risk(binary.boot, CI.type = "pointwise", n.samps = 200)
lines(Y.lower.CL.2.5 ~ S.1, data = sbs, lty = 3, lwd = 2)
lines(Y.upper.CL.97.5 ~ S.1, data = sbs, lty = 3, lwd = 2)
legend("bottomright", lwd = 2, lty = 1:3, 
       legend = c("estimate", "simultaneous CI", "pointwise CI"))

## ----ggpt----------------------------------------------------------------
library(ggplot2)
TE.est <- calc_risk(binary.boot, n.samps = 200)
ggplot(TE.est, 
       aes(x = S.1, y = Y, ymin = Y.lower.CL.0.95, ymax = Y.upper.CL.0.95)) + 
  geom_line() + geom_ribbon(alpha = .2) + ylab(attr(TE.est, "Y.function"))

## ----ccest---------------------------------------------------------------
cc.fit <- binary.cc + integrate_parametric(S.1 ~ BIP) + 
  risk_binary(D = 10) + ps_estimate()
cc.fit

## ----surv1---------------------------------------------------------------
surv.fit <- psdesign(fakedata, Z = Z, Y = Surv(time.obs, event.obs), 
                     S = S.obs, BIP = BIP, CPV = CPV) + 
  integrate_semiparametric(formula.location = S.1 ~ BIP, formula.scale = S.1 ~ 1) + 
  risk_exponential(D = 10) + ps_estimate(method = "BFGS") + ps_bootstrap(n.boots = 20)
surv.fit
plot(surv.fit)

## ----cont1---------------------------------------------------------------
fakedata$Y.cont <- log(fakedata$time.obs + 0.01)
cont.fit <- psdesign(fakedata, Z = Z, Y = Y.cont, 
                     S = S.obs, BIP = BIP, CPV = CPV) + 
  integrate_semiparametric(formula.location = S.1 ~ BIP, formula.scale = S.1 ~ 1) + 
  risk_continuous(D = 10) + ps_estimate(method = "BFGS") + ps_bootstrap(n.boots = 20)
cont.fit
plot(cont.fit, contrast = "risk")

## ------------------------------------------------------------------------
with(fakedata, table(S.obs.cat, BIP.cat))

## ----catfit--------------------------------------------------------------
cat.fit <- psdesign(fakedata, Z = Z, Y = Y.obs, 
                     S = S.obs.cat, BIP = BIP.cat) + 
  integrate_nonparametric(formula = S.1 ~ BIP) + 
  risk_binary(Y ~ S.1 * Z, D = 10, risk = risk.probit) + ps_estimate(method = "BFGS")
cat.fit
plot(cat.fit)

## ----catfitps------------------------------------------------------------
cat.fit.ps <- psdesign(fakedata, Z = Z, Y = Y.obs, 
                     S = S.obs, BIP = BIP.cat) + 
  integrate_nonparametric(formula = S.1 ~ BIP) + 
  risk_binary(Y ~ S.1 * Z, D = 10, risk = risk.logit) + ps_estimate(method = "pseudo-score") + 
  ps_bootstrap(n.boots = 20, method = "pseudo-score")
summary(cat.fit.ps)
plot(cat.fit.ps)

