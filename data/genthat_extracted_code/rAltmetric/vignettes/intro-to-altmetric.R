## ------------------------------------------------------------------------
library(rAltmetric)
library(magrittr)
library(purrr)


ids <- list(c(
  "10.1038/nature09210",
  "10.1126/science.1187820",
  "10.1016/j.tree.2011.01.009",
  "10.1086/664183"
))

alm <- function(x)  altmetrics(doi = x) %>% altmetric_data()

results <- pmap_df(ids, alm)
# This results in a data.frame with one row per identifier.

## ------------------------------------------------------------------------
library(dplyr)
knitr::kable(results %>% select(title, doi,  starts_with("cited")))

