## ----setup, cache = FALSE, echo = FALSE, message = FALSE, warning = FALSE, tidy = FALSE----
knitr::opts_chunk$set(eval = TRUE, message = FALSE, warning = FALSE)

## ----ddm-----------------------------------------------------------------
library(gravity)

fit <- ddm(
    dependent_variable = "flow",
    distance = "distw",
    additional_regressors = c("rta", "comcur", "contig"),
    code_origin = "iso_o",
    code_destination = "iso_d",
    data = gravity_no_zeros
  )

summary(fit)

## ----ddm2----------------------------------------------------------------
library(broom)

tidy(fit)
glance(fit)
augment(fit)

## ----bvu-----------------------------------------------------------------
fit2 <- bvu(
    dependent_variable = "flow",
    distance = "distw",
    additional_regressors = c("rta", "contig", "comcur"),
    income_origin = "gdp_o",
    income_destination = "gdp_d",
    code_origin = "iso_o",
    code_destination = "iso_d",
    data = gravity_no_zeros
  )

tidy(fit2)
glance(fit2)

## ----bvw-----------------------------------------------------------------
fit3 <- bvw(
    dependent_variable = "flow",
    distance = "distw",
    additional_regressors = c("rta", "comcur", "contig"),
    income_origin = "gdp_o",
    income_destination = "gdp_d",
    code_origin = "iso_o",
    code_destination = "iso_d",
    data = gravity_no_zeros
  )

tidy(fit3)
glance(fit3)

