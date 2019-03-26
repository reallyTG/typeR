## ----GlobalOption, echo=FALSE---------------------------------------
knitr::opts_chunk$set(prompt = TRUE, results = "markdown", comment = NA,  fig.width = 5, fig.height = 5, highlight = T, background = "white")
## jss style requirements
options(prompt = "R> ", continue = "+  ", width = 70, useFancyQuotes = FALSE)

## ----usage, eval=FALSE, prompt = FALSE, tidy=FALSE------------------
#  dosresmeta(formula, id, type, v, cases, n, data, intercept = F, center = T,
#    se, lb, ub, covariance = "gl", method = "reml", fcov, ucov,
#    alpha = 0.05, ...)

## ----loading, include = F-------------------------------------------
library("dosresmeta")

## ----singlestudy----------------------------------------------------
library("dosresmeta")
data("cc_ex")
print(cc_ex, row.names = F, digits = 2)

## ----mod.cc, tidy = FALSE-------------------------------------------
mod.cc <- dosresmeta ( formula = logrr ~ dose, type = "cc", cases = case,
             n = n, lb = lb, ub = ub, data = cc_ex)
summary(mod.cc)

## ----predict.cc, echo=TRUE------------------------------------------
predict(mod.cc, delta = 11, exp = TRUE)

## ----saved.predict.cc, echo=FALSE-----------------------------------
delta <- 11
pred.mod.cc <- round(100* (predict(mod.cc, exp = T, delta = 11) - 1), 0)[-1]

## ----multiplestudies------------------------------------------------
data("alcohol_crc")
print(alcohol_crc[1:12 ,], row.names = F, digits = 2)

## ----lin, tidy = FALSE----------------------------------------------
lin <- dosresmeta(formula = logrr ~ dose, id = id, type = type, se = se,
                   cases = cases, n = peryears, data = alcohol_crc)
summary(lin)

## ----pred.lin, echo = TRUE------------------------------------------
predict(lin, delta = 12, exp = TRUE)

## ----save.pred.lin, echo = FALSE------------------------------------
delta <- 12
pred.lin <- 100 * (predict(lin, delta = 12, exp = TRUE) - 1)

## ----loading.rms, include = FALSE-----------------------------------
library("rms")

## ----spl, tidy = FALSE----------------------------------------------
library("rms")
knots <- quantile(alcohol_crc$dose, c(.05, .35, .65, .95))
spl <- dosresmeta(formula = logrr ~ rcs(dose, knots), type = type, id = id,
                  se = se, cases = cases, n = peryears,  data = alcohol_crc)
summary(spl)

## ----chisq, echo=TRUE-----------------------------------------------
waldtest(b = coef(spl), Sigma = vcov(spl), Terms = 2:3)

## ----save.chisq, echo=FALSE-----------------------------------------
wt <- waldtest(b = coef(spl), Sigma = vcov(spl), Terms = 2:3)

## ----curve1, tidy = FALSE, fig.keep = 'none'------------------------
newdata <- data.frame(dose <- seq(0, 60, 1))
xref <- 0
with(predict(spl, newdata, xref, exp = TRUE),{
  plot(get("rcs(dose, knots)dose"), pred, type = "l", ylim = c(.8, 1.8),
       ylab = "Relative risk", xlab = "Alcohol consumption, grams/day", 
       log = "y", bty = "l", las = 1)
  matlines(get("rcs(dose, knots)dose"), cbind(ci.ub, ci.lb), 
           col = 1, lty = "dashed")
})
points(dose, predict(lin, newdata, xref)$pred, type = "l", lty = 3)
rug(alcohol_crc$dose)

## ----curve1plot, echo=FALSE-----------------------------------------
newdata <- data.frame(dose <- seq(0, 60, 1))
xref <- 0
with(predict(spl, newdata, xref, exp = TRUE),{
  plot(get("rcs(dose, knots)dose"), pred, type = "l", ylim = c(.8, 1.8),
       ylab = "Relative risk", xlab = "Alcohol consumption, grams/day", 
       log = "y", bty = "l", las = 1)
  matlines(get("rcs(dose, knots)dose"), cbind(ci.ub, ci.lb), 
           col = 1, lty = "dashed")
})
points(dose, predict(lin, newdata, xref)$pred, type = "l", lty = 3)
rug(alcohol_crc$dose)

## ----curve2, tidy = FALSE, fig.keep = 'none', echo = FALSE----------
xref <- 12
with(predict(spl, newdata, xref, exp = TRUE),{
  plot(get("rcs(dose, knots)dose"), pred, type = "l", ylim = c(.8, 1.8),
       ylab = "Relative risk", xlab = "Alcohol consumption, grams/day", 
       log = "y", bty = "l", las = 1)
  matlines(get("rcs(dose, knots)dose"), cbind(ci.ub, ci.lb), 
           col = 1, lty = "dashed")
})
points(dose, predict(lin, newdata, xref)$pred, type = "l", lty = 3)
rug(alcohol_crc$dose)

## ----pred.spl-------------------------------------------------------
dataTab <- data.frame(dose = seq(0, 60, 12))
predLin <- predict(lin, dataTab, exp = TRUE)
predSpl <- predict(spl, dataTab, exp = TRUE)
round(cbind(lin = predLin, spl = predSpl[4:6]), 2)

## ----curve2plot, echo=FALSE-----------------------------------------
xref <- 12
with(predict(spl, newdata, xref, exp = TRUE),{
  plot(get("rcs(dose, knots)dose"), pred, type = "l", ylim = c(.8, 1.8),
       ylab = "Relative risk", xlab = "Alcohol consumption, grams/day", 
       log = "y", bty = "l", las = 1)
  matlines(get("rcs(dose, knots)dose"), cbind(ci.ub, ci.lb), 
           col = 1, lty = "dashed")
})
points(dose, predict(lin, newdata, xref)$pred, type = "l", lty = 3)
rug(alcohol_crc$dose)

