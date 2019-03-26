## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- echo = F, message = F, warning = F---------------------------------
library(cosinor2)

## ---- fig.align = "center", fig.height = 6, fig.width = 6----------------
fit.panas.cosinor <- population.cosinor.lm(data = PANAS_november, time = PANAS_time, period = 7)

## ------------------------------------------------------------------------
fit.panas.cosinor$conf.ints

## ------------------------------------------------------------------------
fit.panas.cosinor$emp.mean

fit.panas.cosinor$fitted.values

fit.panas.cosinor$residuals

## ------------------------------------------------------------------------
fit.panas.cosinor$single.cos[[6]]

## ------------------------------------------------------------------------
fit.panas.cosinor$pop.mat

## ------------------------------------------------------------------------
fit.temp.cosinor <- cosinor.lm(Temperature ~ time(Time), period = 24, data = temperature_zg)

## ------------------------------------------------------------------------
fit.temp.cosinor$coefficients

## ------------------------------------------------------------------------
correct.acrophase(fit.temp.cosinor)

## ------------------------------------------------------------------------
cosinor.detect(fit.panas.cosinor)

## ------------------------------------------------------------------------
cosinor.detect(fit.temp.cosinor)

## ------------------------------------------------------------------------
cosinor.PR(fit.panas.cosinor)

## ------------------------------------------------------------------------
cosinor.PR(fit.temp.cosinor)

## ---- message = F, warning = F, results = "hide", fig.align = "center", fig.width = 6, fig.height = 6----
periodogram(data = PANAS_november, time = PANAS_time)

## ---- message = F, warning = F, results = "hide", fig.align = "center", fig.width = 6, fig.height = 6----
periodogram(data = PA_extraverts, time = PA_time, periods = 1:24)

## ---- fig.align = "center", fig.height = 6, fig.width = 6----------------
fit.pa_ext.cosinor <- population.cosinor.lm(data = PA_extraverts, time = PA_time, period = 24)
fit.pa_int.cosinor <- population.cosinor.lm(data = PA_introverts, time = PA_time, period = 24)

## ------------------------------------------------------------------------
cosinor.poptests(fit.pa_ext.cosinor, fit.pa_int.cosinor)

## ---- message = F, warning = F, results = "hide", fig.width = 6, fig.height = 12----
fit.panas.ssections <- ssections(data = PANAS_november, time = PANAS_time, period = 7, interval = 7, increment = 1)

## ------------------------------------------------------------------------
fit.panas.ssections$emp.mean

## ------------------------------------------------------------------------
fit.panas.ssections$coefficients

fit.panas.ssections$`p-values`

## ------------------------------------------------------------------------
fit.panas.ssections$cosinors[[3]]

