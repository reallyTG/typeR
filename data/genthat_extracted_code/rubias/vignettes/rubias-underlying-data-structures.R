## ----setup, include = FALSE, echo = FALSE, message=FALSE-----------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(tidyverse)
library(rubias)

## ------------------------------------------------------------------------
cpar <- tcf2param_list(chinook, 5, summ = FALSE)
cpar$RU_starts[1:5]

## ------------------------------------------------------------------------
cpar$RU_vec[1:15]

