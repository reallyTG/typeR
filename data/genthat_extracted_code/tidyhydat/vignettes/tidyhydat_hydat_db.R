## ----setup, include = FALSE----------------------------------------------
library(tidyhydat)
library(dplyr)
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval = FALSE-------------------------------------------------------
#  hydat_download()

## ---- include=FALSE------------------------------------------------------
# we are actually going to use the test database
# so the vignette can be reproducibly rebuilt without
# needing to call hydat_download
prev_default <- hy_set_default_db(hy_test_db())

## ------------------------------------------------------------------------
src <- hy_src()

## ------------------------------------------------------------------------
src_tbls(src)

## ------------------------------------------------------------------------
tbl(src, "STN_OPERATION_SCHEDULE")

## ------------------------------------------------------------------------
tbl(src, "STN_OPERATION_SCHEDULE") %>%
  filter(STATION_NUMBER == "05AA008") %>%
  collect()

## ------------------------------------------------------------------------
hy_src_disconnect(src)

## ---- include=FALSE------------------------------------------------------
# set the default location back to whatever it was before
tidyhydat:::hy_set_default_db(NULL)

