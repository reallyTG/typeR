## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(riskclustr)

## ------------------------------------------------------------------------
library(riskclustr)

mod1 <- eh_test_subtype(
  label = "subtype", 
  M = 4, 
  factors = list("x1", "x2", "x3"), 
  data = subtype_data)

## ----eval = FALSE--------------------------------------------------------
#  mod1$beta

## ----echo = FALSE--------------------------------------------------------
knitr::kable(mod1$beta)

## ----eval = FALSE--------------------------------------------------------
#  mod1$beta_se

## ----echo = FALSE--------------------------------------------------------
knitr::kable(mod1$beta_se)

## ----eval = FALSE--------------------------------------------------------
#  mod1$eh_pval

## ----echo = FALSE--------------------------------------------------------
knitr::kable(mod1$eh_pval)

## ----eval = FALSE--------------------------------------------------------
#  mod1$beta_se_p

## ----echo = FALSE--------------------------------------------------------
knitr::kable(mod1$beta_se_p)

## ----eval = FALSE--------------------------------------------------------
#  mod1$or_ci_p

## ----echo = FALSE--------------------------------------------------------
knitr::kable(mod1$or_ci_p)

## ------------------------------------------------------------------------
library(riskclustr)

mod2 <- eh_test_marker(
  markers = list("marker1", "marker2"),
  factors = list("x1", "x2", "x3"),
  case = "case",
  data = subtype_data)

## ----eval = FALSE--------------------------------------------------------
#  mod2$gamma

## ----echo = FALSE--------------------------------------------------------
knitr::kable(mod2$gamma)

## ----eval = FALSE--------------------------------------------------------
#  mod2$gamma_se

## ----echo = FALSE--------------------------------------------------------
knitr::kable(mod2$gamma_se)

## ----eval = FALSE--------------------------------------------------------
#  mod2$gamma_pval

## ----echo = FALSE--------------------------------------------------------
knitr::kable(mod2$gamma_pval)

## ----eval = FALSE--------------------------------------------------------
#  mod2$gamma_se_p

## ----echo = FALSE--------------------------------------------------------
knitr::kable(mod2$gamma_se_p)

