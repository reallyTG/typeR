## ----setup, include = FALSE-------------------------------------------------------------------------------------------------------------------------
options(width = 150)
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.align = "center", fig.height = 6, fig.width = 6,
  out.width = "66.66%"
)

## ----packages---------------------------------------------------------------------------------------------------------------------------------------
library(rsimsum)
library(dplyr)
library(ggplot2)
library(knitr)

## ----table------------------------------------------------------------------------------------------------------------------------------------------
data("MIsim", package = "rsimsum")
MIsim %>%
  simsum(estvarname = "b", se = "se", methodvar = "method", true = 0.5) %>%
  summary() %>%
  get_data() %>%
  kable()

## ----plot-------------------------------------------------------------------------------------------------------------------------------------------
MIsim %>%
  simsum(estvarname = "b", se = "se", methodvar = "method", true = 0.5) %>%
  summary() %>%
  get_data(sstat = "bias") %>%
  ggplot(aes(x = method, y = est, ymin = lower, ymax = upper)) +
  geom_hline(yintercept = 0, color = "red", lty = "dashed") +
  geom_point() +
  geom_errorbar(width = 1 / 3) +
  theme_bw() +
  labs(x = "Method", y = "Bias")

