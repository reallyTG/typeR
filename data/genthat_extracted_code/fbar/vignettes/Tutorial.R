## ---- eval=FALSE---------------------------------------------------------
#  install.packages('fbar')
#  library(fbar)

## ---- eval=FALSE---------------------------------------------------------
#  devtools::install_github('maxconway/fbar')
#  library(fbar)

## ---- eval=FALSE---------------------------------------------------------
#  ROI::ROI_registered_solvers()
#  install.packages('ROI.plugin.ecos')
#  library('ROI.plugin.ecos') # This line is necessary to register the plugin with ROI the first time
#  ROI::ROI_registered_solvers()

## ------------------------------------------------------------------------
library(fbar) # load fbar package
data(ecoli_core)

## ---- eval=FALSE---------------------------------------------------------
#  library(dplyr) # load dplyr, to explore data
#  
#  ecoli_fluxes <- ecoli_core %>%
#    reactiontbl_to_expanded() %>%
#    expanded_to_ROI() %>%
#    ROI::ROI_solve() %>%
#    ROI::solution()
#  
#  ecoli_core_evaluated <- ecoli_core %>%
#    mutate(flux = ecoli_fluxes)

## ---- eval=FALSE---------------------------------------------------------
#  evaluated <- find_fluxes_df(ecoli_core)

