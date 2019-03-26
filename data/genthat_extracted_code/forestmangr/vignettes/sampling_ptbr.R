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

dados_acs_piloto <- exfm3
dados_acs_def <- exfm4
dados_ace_piloto <- exfm1
dados_ace_def <- exfm2
dados_as <- exfm5


## ------------------------------------------------------------------------
dados_acs_piloto

## ------------------------------------------------------------------------
sprs(dados_acs_piloto, "VWB", 3000, 46.8,error = 20, pop = "fin")

## ------------------------------------------------------------------------
dados_acs_def

## ------------------------------------------------------------------------
sprs(dados_acs_def, "VWB", 3000, 46.8, error = 20, pop = "fin")

## ------------------------------------------------------------------------
sprs(dados_acs_def, "VWB", "PLOT_AREA", "TOTAL_AREA", 
     error = 20, pop = "fin")

## ------------------------------------------------------------------------
sprs(dados_ace_def, "VWB", "PLOT_AREA", "STRATA_AREA",
     .groups = "STRATA" ,error = 20, pop = "fin")


## ------------------------------------------------------------------------
dados_ace_piloto

## ------------------------------------------------------------------------
strs(dados_ace_piloto, "VWB", 3000, c(14.4, 16.4, 14.2), 
     strata = "STRATA", error = 5, pop = "fin")

## ------------------------------------------------------------------------
dados_ace_def

## ------------------------------------------------------------------------
strs(dados_ace_def, "VWB", "PLOT_AREA", "STRATA_AREA", 
     strata = "STRATA", error = 5, pop = "fin")

## ------------------------------------------------------------------------
dados_as

## ------------------------------------------------------------------------
sprs(dados_as, "VWB", 200, 18)

## ------------------------------------------------------------------------
ss_diffs(dados_as, "VWB", 200, 18)

