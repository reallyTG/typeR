## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----gh-installation, eval = FALSE---------------------------------------
#  # install.packages("devtools")
#  devtools::install_github("jacobkap/meditations")

## ----example-------------------------------------------------------------
meditations::meditations()

## ------------------------------------------------------------------------
meditations::meditations(5)

