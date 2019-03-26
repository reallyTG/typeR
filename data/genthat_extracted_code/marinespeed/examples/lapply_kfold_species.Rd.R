library(marinespeed)


### Name: lapply_kfold_species
### Title: Apply a function over the folds of a set of species
### Aliases: lapply_kfold_species

### ** Examples

## Not run: 
##D plot_occurrences <- function(speciesname, data, fold) {
##D    title <- paste0(speciesname, " (fold = ", fold, ")")
##D    plot(data$occurrence_train[,c("longitude", "latitude")], pch=".",
##D         col="blue", main = title)
##D    points(data$occurrence_test[,c("longitude", "latitude")], pch=".",
##D         col="red")
##D }
##D 
##D # plot training (blue) and test (red) occurrences
##D # of the first 2 folds for the first 10 species
##D species <- list_species()
##D lapply_kfold_species(plot_occurrences, species=species[1:5,],
##D                      fold_type = "disc", k = 1:2)
## End(Not run)



