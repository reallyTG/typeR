## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(leanpubr)
slug = "biostatmethods"
res = lp_summary(slug, error = FALSE, verbose = TRUE)
res$content

