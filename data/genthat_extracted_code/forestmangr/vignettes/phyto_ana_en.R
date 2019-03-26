## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>")
knitr::opts_chunk$set(fig.width=7, fig.height=5)
options(tibble.print_min = 6L, tibble.print_max = 6L)
library(forestmangr)

## ------------------------------------------------------------------------
library(forestmangr)
data(exfm20)
data_ex <- exfm20

data_ex

## ------------------------------------------------------------------------
species_diversity(data_ex, "scientific.name")

## ------------------------------------------------------------------------
similarity_matrix(data_ex, "scientific.name", "transect", index = "Jaccard")

## ------------------------------------------------------------------------
similarity_matrix(exfm20, "scientific.name", "transect", index = "Jaccard", dendrogram = TRUE, n_groups = 3)

## ------------------------------------------------------------------------
species_aggreg(data_ex, "scientific.name", "transect")

## ------------------------------------------------------------------------
forest_structure(data_ex, "scientific.name", "dbh", "transect", 10000)

## ------------------------------------------------------------------------
forest_structure(data_ex, "scientific.name", "dbh", "transect", 10000, "canopy.pos", "light") 

## ------------------------------------------------------------------------
bdq_meyer(data_ex, "transect", "dbh", 1000,licourt_index = 2)

## ------------------------------------------------------------------------
classified <- diameter_class(data_ex,"dbh", "transect", 10000, 10, 10, "scientific.name") 

head(classified)

## ------------------------------------------------------------------------
classified <- diameter_class(data_ex,"dbh", "transect", 10000, 10, 10,
               "scientific.name", cc_to_column=TRUE)
head(classified)

