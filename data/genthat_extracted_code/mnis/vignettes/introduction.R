## ----eval=TRUE-----------------------------------------------------------
library(mnis)
x <- ref_titles(tidy = FALSE)
x

## ----eval=TRUE-----------------------------------------------------------
library(mnis)
x <- ref_titles(tidy = TRUE)
x

## ----eval=TRUE-----------------------------------------------------------
library(mnis)
x <- mnis_party_state("2017-04-04")
x



## ----eval=TRUE-----------------------------------------------------------
 y <- mnis_party_state("Lords", "2017-04-04")
 y


