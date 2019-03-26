## ----include=FALSE-------------------------------------------------------
knitr::opts_chunk$set(warning=FALSE, comment=NA)

## ----message=FALSE, warning=FALSE, results="hide", eval=FALSE------------
#  remotes::install_github("ropensci/rfishbase")

## ----message=FALSE, warning=FALSE, results="hide"------------------------
library("rfishbase")

## ------------------------------------------------------------------------
fish <- c("Oreochromis niloticus", "Salmo trutta")

## ------------------------------------------------------------------------
fish <- validate_names(c("Oreochromis niloticus", "Salmo trutta"))

## ------------------------------------------------------------------------
fish <- species_list(Genus = "Labroides")
fish

## ------------------------------------------------------------------------
trout <- common_to_sci("trout")
trout

## ------------------------------------------------------------------------
species(trout$Species)

## ------------------------------------------------------------------------
dat <- species(trout$Species, fields=c("Species", "PriceCateg", "Vulnerability"))
dat

## ------------------------------------------------------------------------
list_fields("Resilience")

## ------------------------------------------------------------------------
stocks(trout$Species, fields=c("Species", "Resilience", "StockDefs"))

## ------------------------------------------------------------------------
Sys.setenv(FISHBASE_VERSION="17.07")

## ------------------------------------------------------------------------
load_taxa(server="sealifebase")

## ------------------------------------------------------------------------
species(server="sealifebase")

