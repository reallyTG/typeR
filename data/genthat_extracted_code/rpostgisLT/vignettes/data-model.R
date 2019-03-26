## ----setup, include=FALSE------------------------------------------------
# Global options
library(knitr)
opts_chunk$set(fig.path="fig/")

## ---- eval=FALSE---------------------------------------------------------
#  library(adehabitatLT)
#  data(ibexraw)
#  attr(ibexraw[[1]]$date, "tzone")
#  # [1] "Europe/Paris"
#  ibexraw[[1]][1, "date"]
#  # [1] "2003-06-01 00:00:56 CEST"
#  format(ibexraw[[1]][1, "date"], tz="America/Florida", usetz=TRUE)
#  # [1] "2003-05-31 22:00:56 America"

