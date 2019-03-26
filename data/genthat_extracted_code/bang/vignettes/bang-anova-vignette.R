## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(comment = "#>", collapse = TRUE)
set.seed(47)

## ---- include = FALSE----------------------------------------------------
set.seed(7052009)

## ------------------------------------------------------------------------
library(bang)
# Extract RCP2.6 data
RCP26_2 <- temp2[temp2$RCP == "rcp26", ]

## ------------------------------------------------------------------------
# Number of observations
length(RCP26_2[, "index"])
# Numbers of runs for each GCM
table(RCP26_2[, "GCM"])
# Number of GCMs with at least one run
sum(table(RCP26_2[, "GCM"]) > 0)

## ---- fig.show='hold', fig.width = 3.45, fig.height = 3.45---------------
# The response is the index, the explanatory factor is the GCM
temp_res <- hanova1(resp = RCP26_2[, "index"], fac = RCP26_2[, "GCM"])
# Plots relating to the posterior sample of the variance parameters
plot(temp_res, params = "ru")
plot(temp_res, ru_scale = TRUE)

## ---- fig.width = 5, fig.align='center'----------------------------------
hist(temp_res$sim_vals[, "mu"],  main = "", xlab = expression(mu), prob = TRUE)
lines(density(temp_res$sim_vals[, "mu"]))

## ------------------------------------------------------------------------
plot(temp_res, params = "pop", which_pop = "all", one_plot = TRUE)

## ---- fig.show='hold', fig.width = 3.45, fig.height = 3.45---------------
coag1 <- hanova1(resp = coagulation[, 1], fac = coagulation[, 2], n = 10000)
coag2 <- hanova1(resp = coagulation[, 1], fac = coagulation[, 2], n = 10000,
                 param = "original", r = 1)
plot(coag1, params = "ru")
plot(coag1, ru_scale = TRUE)

## ------------------------------------------------------------------------
probs <- c(2.5, 25, 50, 75, 97.5) / 100
all1 <- cbind(coag1$theta_sim_vals, coag1$sim_vals)
round(t(apply(all1, 2, quantile, probs = probs)), 1)

## ------------------------------------------------------------------------
coag3 <- hanova1(resp = coagulation[, 1], fac = coagulation[, 2],
                 param = "original", prior = "cauchy", hpars = c(10, 1e6))

