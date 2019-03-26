## ------------------------------------------------------------------------
library(fbar)
data(ecoli_core)

try({ # this will fail if no appropriate solver is available.
  library(ROI.plugin.ecos)

  ecoli_core_with_flux <- find_fluxes_df(ecoli_core)
})

## ---- message=FALSE------------------------------------------------------
library(fbar)
library(dplyr)
library(ROI)
try(library(ROI.plugin.ecos))
data(ecoli_core)

roi_model <- ecoli_core %>%
  reactiontbl_to_expanded %>%
  expanded_to_ROI
  
# First, we need to check that an appropriate solver is available.
# If you don't have an appropriate solver, see the section on installing 
# one later in this document.
if(length(ROI_applicable_solvers(roi_model))>=1){
  roi_result <- ROI_solve(roi_model)
  
  ecoli_core_with_flux <- ecoli_core %>%
    mutate(flux = roi_result[['solution']])
}

## ---- eval=FALSE---------------------------------------------------------
#  devtools::install_github('maxconway/fbar')

## ---- eval=FALSE---------------------------------------------------------
#  install.packages('ROI.plugin.ecos')

