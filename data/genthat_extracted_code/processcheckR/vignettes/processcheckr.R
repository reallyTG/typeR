## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----gh-installation, eval = FALSE---------------------------------------
#  # install.packages("devtools")
#  devtools::install_github("gertjanssenswillen/processcheckR")

## ----example-------------------------------------------------------------
library(bupaR)
library(processcheckR)
sepsis %>%
  # check if cases starts with "ER Registration"
  check_rule(starts("ER Registration"), label = "r1") %>%
  # check if activities "CRP" and "LacticAcid" occur together
  check_rule(and("CRP","LacticAcid"), label = "r2") %>%
  group_by(r1, r2) %>%
  n_cases() 

