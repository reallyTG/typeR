## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE----------------------------------------------------------
#  install.packages('unixtools', repos = 'http://www.rforge.net/')
#  unixtools::set.tempdir("<path-to-temp-dir>")

## ----eval=FALSE----------------------------------------------------------
#  to-report green.patches
#    report count patches with [pcolor = green]
#  end

## ----eval=FALSE----------------------------------------------------------
#  library(future)
#  plan(multisession)
#  results %<-% run_nl_all(nl = nl)

## ----eval=FALSE----------------------------------------------------------
#  library(future)
#  plan(multisession)
#  results %<-% run_nl_all(nl = nl, split = 4)

