## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ---- warning = FALSE----------------------------------------------------
library(openEBGM)
data(caers)
proc <- processRaw(caers, stratify = FALSE, zeroes = FALSE)
squashed <- squashData(proc)
theta_init <- data.frame(alpha1 = c(0.2, 0.1, 0.3, 0.5, 0.2),
                         beta1  = c(0.1, 0.1, 0.5, 0.3, 0.2),
                         alpha2 = c(2,   10,  6,   12,  5),
                         beta2  = c(4,   10,  6,   12,  5),
                         p      = c(1/3, 0.2, 0.5, 0.8, 0.4))
hyper_estimate <- autoHyper(squashed, theta_init = theta_init, 
                            zeroes = FALSE, squashed = TRUE, N_star = 1)

## ------------------------------------------------------------------------
ebout <- ebScores(proc, hyper_estimate = hyper_estimate,
                  quantiles = c(5, 95)) #For the 5th and 95th percentiles
ebout_noquant <- ebScores(proc, hyper_estimate = hyper_estimate,
                          quantiles = NULL) #For no quantiles

## ------------------------------------------------------------------------
#We can print an openEBGM object to get a quick look at the contents
print(ebout)
print(ebout_noquant, threshold = 3)

## ---- fig.height=6, fig.width = 7----------------------------------------
summary(ebout)

## ------------------------------------------------------------------------
summary(ebout, plot.out = FALSE, log.trans = TRUE)

## ---- fig.height=6, fig.width = 7----------------------------------------
plot(ebout)

## ---- fig.height = 6, fig.width = 7--------------------------------------
plot(ebout, event = "CHOKING")

## ---- fig.height = 6, fig.width = 7--------------------------------------
plot(ebout, plot.type = "histogram")

## ---- fig.height = 6, fig.width = 7--------------------------------------
plot(ebout, plot.type = "histogram", event = "CHOKING")

## ---- fig.height = 6, fig.width = 7--------------------------------------
plot(ebout, plot.type = "shrinkage")

## ---- fig.height = 6, fig.width = 7--------------------------------------
plot(ebout, plot.type = "shrinkage", event = "CHOKING")

