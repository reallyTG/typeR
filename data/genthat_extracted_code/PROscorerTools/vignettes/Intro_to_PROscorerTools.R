## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "README-"
)

## ----eval=FALSE----------------------------------------------------------
#  install.packages("PROscorerTools")

## ----eval=FALSE----------------------------------------------------------
#  devtools::install_github("raybaser/PROscorerTools")

## ----eval = FALSE--------------------------------------------------------
#  library(PROscorerTools)

## ----eval = FALSE--------------------------------------------------------
#  dat <- makeFakeData(n = 20, nitems = 6, values = 0:4, id = TRUE)

## ----eval=FALSE----------------------------------------------------------
#  dat_scored <- scoreScale(df = dat, items = 2:7, type = "sum")
#  dat_scored

## ----eval=FALSE----------------------------------------------------------
#  dat_scored <- scoreScale(df = dat, items = 2:7, type = "sum", okmiss = 0.49)
#  dat_scored

## ----eval=FALSE----------------------------------------------------------
#  dat_scored <- scoreScale(df = dat, items = 2:7, type = "sum", okmiss = 0.49)
#  dat_scored

