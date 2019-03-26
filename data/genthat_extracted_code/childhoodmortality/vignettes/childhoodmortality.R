## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval = FALSE-------------------------------------------------------
#  install.packages("childhoodmortality")
#  library(childhoodmortality)
#  

## ---- eval = FALSE-------------------------------------------------------
#  install.packages("devtools")
#  devtools::install_github("caseybreen/childhoodmortality")
#  

## ---- eval = FALSE-------------------------------------------------------
#  underfive_mortality_rates <- childhoodmortality(
#   data = model_ipums_dhs_dataset,
#   grouping ="WEALTHQ",
#   rate_type = "underfive"
#  )
#  

