## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- message=FALSE, warning=FALSE---------------------------------------
library(ruin)
set.seed(1991)

model <- CramerLundbergCapitalInjections(
  initial_capital = 0,
  premium_rate = 1,
  claim_poisson_arrival_rate = 1,
  claim_size_generator = rexp,
  claim_size_parameters = list(rate = 1),
  capital_injection_poisson_rate = 1,
  capital_injection_size_generator = rexp,
  capital_injection_size_parameters = list(rate = 1)
)

## ---- message=FALSE, warning=FALSE---------------------------------------
one_path <- simulate_path(model = model, max_time_horizon = 10)

## ---- message=FALSE, warning=FALSE---------------------------------------
one_path <- simulate_path(model = model, max_time_horizon = 10)

head(one_path@path)

## ---- message=FALSE, warning=FALSE---------------------------------------
plot_path(one_path)

## ---- message=FALSE, warning=FALSE---------------------------------------
ruin_probability(model = model, time_horizon = 10, parallel = FALSE)

