## ------------------------------------------------------------------------
library(marinespeed)

# set a data directory, preferably something different from tempdir to avoid 
# unnecessary downloads for every R session
options(marinespeed_datadir = tempdir())

# list all species
species <- list_species()

## ---- echo = FALSE-------------------------------------------------------
knitr::kable(species[1:5,], row.names = FALSE)

## ------------------------------------------------------------------------
# all species information
info <- species_info()
colnames(info)

## ---- cache = TRUE, eval=FALSE-------------------------------------------
#  get_occ_count <- function(speciesname, occ) {
#    nrow(occ)
#  }
#  record_counts <- lapply_species(get_occ_count)
#  sum(unlist(record_counts))

## ---- echo=FALSE---------------------------------------------------------
868151

## ---- echo=FALSE---------------------------------------------------------

## plot first 2 disc folds for the first 2 species (blue=trainig, red=test)
plot_occurrences <- function(speciesname, data, fold) {
  fname <- paste0(sub(" ", "_", speciesname), fold, ".jpeg")
  jpeg(filename = fname)
  title <- paste0(speciesname, " (fold = ", fold, ")")  
  plot(data$occurrence_train[,c("longitude", "latitude")], pch=20, col="blue",
       main = title)
  points(data$occurrence_test[,c("longitude", "latitude")], pch=20, col="red")
 
  dev.off()
}

x <- lapply_kfold_species(plot_occurrences, species=species[1:2,],
                     fold_type = "disc", k = 1:2)

## ---- eval=FALSE, echo=TRUE----------------------------------------------
#  ## plot first 2 disc folds for the first 2 species (blue=trainig, red=test)
#  plot_occurrences <- function(speciesname, data, fold) {
#    title <- paste0(speciesname, " (fold = ", fold, ")")
#    plot(data$occurrence_train[,c("longitude", "latitude")], pch=20, col="blue",
#         main = title)
#    points(data$occurrence_test[,c("longitude", "latitude")], pch=20, col="red")
#  }
#  
#  lapply_kfold_species(plot_occurrences, species=species[1:2,],
#                       fold_type = "disc", k = 1:2)

