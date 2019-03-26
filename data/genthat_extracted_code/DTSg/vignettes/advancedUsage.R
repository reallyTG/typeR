## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

options("DTSgClone" = TRUE)

## ------------------------------------------------------------------------
library(DTSg)

data(flow)
TS <- DTSg$new(flow)
TS

## ------------------------------------------------------------------------
TS$alter("2007-01-01", "2008-12-31")
# end date is still in the year 2012
TS

options("DTSgClone" = FALSE)
getOption("DTSgClone")
TS$alter("2007-01-01", "2008-12-31")
# end date is in the year 2008 now
TS

## ------------------------------------------------------------------------
TSc <- TS$clone(deep = TRUE)
#  or clone(TS, deep = TRUE)

## ------------------------------------------------------------------------
TS <- DTSg$
  new(flow)$
  alter("2007-01-01", "2008-12-31")$
  colapply(interpolateLinear)$
  aggregate(byYm____, mean)
TS

## ------------------------------------------------------------------------
if (requireNamespace("magrittr", quietly = TRUE)) {
  library(magrittr)
  
  TS <- new("DTSg", flow) %>%
    alter("2007-01-01", "2008-12-31") %>%
    colapply(interpolateLinear) %>%
    aggregate(byYm____, mean)
  TS
}

