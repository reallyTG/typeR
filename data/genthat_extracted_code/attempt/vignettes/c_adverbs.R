## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  error = TRUE,
  collapse = TRUE,
  comment = "#>"
)
library(attempt)

## ----eval = TRUE---------------------------------------------------------
silent_log <- silently(log)
silent_log(1)
silent_log("a")
# Error: argument non numérique pour une fonction mathématique

## ------------------------------------------------------------------------
silent_matrix <- silently(matrix)
silent_matrix(1:3, 2)
#Warning message:
#In .f(...) :
#  la longueur des données [3] n'est pas un diviseur ni un multiple du nombre de lignes [2]

## ------------------------------------------------------------------------
sure_log <- surely(log)
sure_log(1)
# [1] 0
sure_log("a")
# Error: argument non numérique pour une fonction mathématique

## ------------------------------------------------------------------------
as_num_msg <- with_message(as.numeric, msg = "We're performing a numeric conversion")
as_num_warn <- with_warning(as.numeric, msg = "We're performing a numeric conversion")
as_num_msg("1")
as_num_warn("1")

