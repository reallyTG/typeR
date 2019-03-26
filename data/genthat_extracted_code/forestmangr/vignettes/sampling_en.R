## ---- echo = FALSE, message = FALSE, warning=FALSE-----------------------
knitr::opts_chunk$set(collapse = T, comment = "#>")
knitr::opts_chunk$set(fig.width=7, fig.height=5)
options(tibble.print_min = 6L, tibble.print_max = 6L)
library(forestmangr)

## ------------------------------------------------------------------------
library(forestmangr)
data(exfm1)
data(exfm2)
data(exfm3)
data(exfm4)
data(exfm5)

data_acs_pilot <- as.data.frame(exfm3)
data_acs_def <- as.data.frame(exfm4)
data_ace_pilot <- as.data.frame(exfm1)
data_ace_def <- as.data.frame(exfm2)
data_as <- as.data.frame(exfm5)


## ------------------------------------------------------------------------
data_acs_pilot

## ------------------------------------------------------------------------
sprs(data_acs_pilot, "VWB", 3000, 46.8,error = 20, pop = "fin")

## ------------------------------------------------------------------------
data_acs_def

## ------------------------------------------------------------------------
sprs(data_acs_def, "VWB", 3000, 46.8, error = 20, pop = "fin")

## ------------------------------------------------------------------------
sprs(data_acs_def, "VWB", "PLOT_AREA", "TOTAL_AREA", 
     error = 20, pop = "fin")

## ------------------------------------------------------------------------
sprs(data_ace_def, "VWB", "PLOT_AREA", "STRATA_AREA",
     .groups = "STRATA" ,error = 20, pop = "fin")


## ------------------------------------------------------------------------
data_ace_pilot

## ------------------------------------------------------------------------
strs(data_ace_pilot, "VWB", 3000, c(14.4, 16.4, 14.2), 
     strata = "STRATA", error = 5, pop = "fin")

## ------------------------------------------------------------------------
data_ace_def

## ------------------------------------------------------------------------
strs(data_ace_def, "VWB", "PLOT_AREA", "STRATA_AREA", 
     strata = "STRATA", error = 5, pop = "fin")

## ------------------------------------------------------------------------
data_as

## ------------------------------------------------------------------------
sprs(data_as, "VWB", 200, 18)

## ------------------------------------------------------------------------
ss_diffs(data_as, "VWB", 200, 18)

