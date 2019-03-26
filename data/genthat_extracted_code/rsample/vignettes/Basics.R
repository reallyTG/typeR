## ----ex_setup, include=FALSE---------------------------------------------
knitr::opts_chunk$set(
  message = FALSE,
  digits = 3,
  collapse = TRUE,
  comment = "#>"
  )
options(digits = 3)

## ----mtcars_bt, message=FALSE--------------------------------------------
library(rsample)
set.seed(8584)
bt_resamples <- bootstraps(mtcars, times = 3)
bt_resamples

## ----rsplit--------------------------------------------------------------
first_resample <- bt_resamples$splits[[1]]
first_resample

## ----rsplit_df-----------------------------------------------------------
head(as.data.frame(first_resample))
as.data.frame(first_resample, data = "assessment")

