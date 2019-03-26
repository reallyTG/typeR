## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----finite_var----------------------------------------------------------
library("diagis")
set.seed(1)
x <- rgamma(10000, 1, 0.75)
w <- dgamma(x, 2, 1) / dgamma(x, 1, 0.75)
plot(w)
weighted_mean(x, w)

## ----infinite_var--------------------------------------------------------
set.seed(1)
x_bad <- rgamma(10000, 1, 2)
w_bad <- dgamma(x_bad, 2, 1) / dgamma(x_bad, 1, 2)
plot(w_bad)
weighted_mean(x_bad, w_bad)

## ----weight_plot---------------------------------------------------------
weight_plot(w)

## ----weight_plot_bad-----------------------------------------------------
weight_plot(w_bad)

