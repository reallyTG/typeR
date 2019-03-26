## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- results="hide"-----------------------------------------------------
library(plsr)
plsr_obj=pls(X=rating_data,Y=tracking_data,n_perm=1000,n_boot=10)

## ------------------------------------------------------------------------
summary(plsr_obj)

## ---- echo=FALSE, fig.width = 3.5, fig.align = "center"------------------
plsr:::plot_perm_results(plsr_obj)

