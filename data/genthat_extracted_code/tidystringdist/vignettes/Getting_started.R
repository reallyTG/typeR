## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval = FALSE--------------------------------------------------------
#  install.packages("tidystringdist")

## ----eval = FALSE--------------------------------------------------------
#  # install.packages(remotes)
#  remotes::install_github("ColinFay/tidystringdist")

## ------------------------------------------------------------------------
library(tidystringdist)

tidy_comb_all(LETTERS[1:3])

tidy_comb_all(iris, Species)

## ------------------------------------------------------------------------
tidy_comb("Paris", state.name)

## ----example, warnings = FALSE, error=FALSE, message=FALSE---------------
comb <- tidy_comb_all(state.name) 
tidy_stringdist(comb)

## ------------------------------------------------------------------------
comb <- tidy_comb_all(state.name)
tidy_stringdist(comb, method = c("osa","jw"))

