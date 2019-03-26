## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(Repliscope)

## ---- echo=FALSE, results='loadBed'--------------------------------------
knitr::kable(head(Repliscope::W303_G2, 5))

## ----ratioTable,echo=F---------------------------------------------------
knitr::kable(head(W303,5))

