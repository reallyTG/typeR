## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(comment = "#>", collapse = TRUE)
set.seed(47)

## ---- fig.show='hold', fig.width = 3.45, fig.height = 3.45---------------
library(bang)
# Default prior, sampling on (rotated) (log(mean), log(alpha + beta)) scale
rat_res <- hef(model = "beta_binom", data = rat, n = 10000)
plot(rat_res)
plot(rat_res, ru_scale = TRUE)

## ------------------------------------------------------------------------
summary(rat_res)

## ------------------------------------------------------------------------
pump

## ---- fig.show='hold', fig.width = 3.45, fig.height = 3.45---------------
pump_res <- hef(model = "gamma_pois", data = pump, hpars = c(1, 0.01, 1, 0.01))
plot(pump_res)
plot(pump_res, ru_scale = TRUE)
summary(pump_res)

