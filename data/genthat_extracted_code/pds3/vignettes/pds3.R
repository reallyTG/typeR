## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE----------------------------------------------------------
#  # Install devtools if you don't already have it
#  install.packages("devtools")
#  # Install the development version of pds3
#  devtools::install_github("mwaldstein/pds3")

## ----process-------------------------------------------------------------
library(pds3)
res <- pds3_read(dat)
str(res$odl)

