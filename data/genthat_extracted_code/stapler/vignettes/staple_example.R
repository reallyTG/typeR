## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(stapler)

## ----sim_data, include=FALSE---------------------------------------------
images = staple_example_data()

## ----data----------------------------------------------------------------
library(stapler)
images = staple_example_data()
res = staple(x = images, set_orient = TRUE)
print(names(res))

## ------------------------------------------------------------------------
x = matrix(rbinom(5000, size = 5, prob = 0.5), ncol = 1000)
table(x)
res_mult = staple_multi_mat(x)
ncol(res_mult$probability)
colnames(res_mult$probability)

