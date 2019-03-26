## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>")
library(noncomplyR)
set.seed(101)

## ------------------------------------------------------------------------
model_fit <- compliance_chain(vitaminA, outcome_model = "binary", exclusion_restriction = T,
                              strong_access = T, n_iter = 1000, n_burn = 10)
head(model_fit)

## ------------------------------------------------------------------------
cace_posterior <- cace(chain = model_fit, outcome_model = "binary", strong_access = T)
head(cace_posterior)

## ------------------------------------------------------------------------
summarize_chain(cace_posterior)

