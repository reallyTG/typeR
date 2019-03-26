## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  results="hide",
  eval = Sys.getenv("CBOETTIG_TOKEN", FALSE)
)

Sys.setenv(piggyback_cache_duration=0)


## ------------------------------------------------------------------------
library(piggyback)

## ------------------------------------------------------------------------
pb_list(repo = "cboettig/piggyback-tests", 
        tag = "v0.0.1")

## ----include=FALSE-------------------------------------------------------
unlink("*.gz")
unlink("data/", TRUE)

