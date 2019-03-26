## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup_mp, eval = FALSE----------------------------------------------
#  library(knitrProgressBar)
#  library(parallel)
#  
#  arduously_long_nchar <- function(input_var, .pb=NULL) {
#  
#    update_progress(.pb) # this is a function provided by the package
#  
#    Sys.sleep(0.1)
#  
#    nchar(input_var)
#  
#  }

## ----set_progress, eval = FALSE------------------------------------------
#  set_kpb <- set_progress_mp("progress_file.log")

## ----run_mp, eval = FALSE------------------------------------------------
#  options(mc.cores = 2)
#  mclapply(seq(1, 100), arduously_long_nchar, .pb = set_kpb)

## ----watch_mp, eval = FALSE----------------------------------------------
#  kpb_watch <- watch_progress_mp(100, watch_location = "progress_file.log")
#  kpb_watch

