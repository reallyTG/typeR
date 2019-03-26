## ----setup, include = FALSE, results = 'markup'--------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#"
)

## ---- echo = FALSE-------------------------------------------------------
# this will print "2018" in 2018, and "2018-yyyy" after 2018.
yrs <- paste(unique(c(2018, format(Sys.Date(), "%Y"))), collapse = "-")

