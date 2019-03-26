## ----init, include = FALSE-----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup---------------------------------------------------------------
library(knitrProgressBar)

arduously_long_nchar <- function(input_var, .pb=NULL) {
  
  update_progress(.pb) # this is a function provided by the package
  
  Sys.sleep(0.1)
  
  nchar(input_var)
  
}

## ----make_kpb_1, eval = FALSE--------------------------------------------
#  # not run
#  pb <- progress_estimated(length(letters))
#  
#  purrr::map_int(letters, arduously_long_nchar, .pb = pb)

## ----make_kpb_suppression, eval = FALSE----------------------------------
#  options(kpb.suppress_noninteractive = TRUE)

## ----make_kpb_logfiles, eval = FALSE-------------------------------------
#  options(kpb.use_logfile = TRUE)

## ----make_kpb_specific_file, eval = FALSE--------------------------------
#  options(kpb.use_logfile = TRUE)
#  options(kpb.log_file = "my_logfile.log")

## ----make_kkpb_pattern, eval = FALSE-------------------------------------
#  options(kpb.use_logfile = TRUE)
#  options(kpb.log_pattern = "pb_out_")

## ----direct_con, eval = FALSE--------------------------------------------
#  # to terminal, or print in a knitr chunk
#  pb <- progress_estimated(length(letters), progress_location = stdout())
#  
#  # to stderr, so visible from knitr
#  pb <- progress_estimated(length(letters), progress_location = stderr())
#  
#  # to a file, visible using tailf
#  pb <- progress_estimated(length(letters), progress_location = file("progress.log", open = "w"))

## ----test_pb_null--------------------------------------------------------
pb <- progress_estimated(length(letters), progress_location = NULL)

purrr::map_int(letters, arduously_long_nchar, .pb = pb)

