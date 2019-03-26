library(marinespeed)


### Name: get_folds
### Title: Get folds
### Aliases: get_folds

### ** Examples

## Not run: 
##D folds <- get_folds("random")
##D 
##D abalistes <- "Abalistes stellatus"
##D occ <- get_occurrences(abalistes)
##D bg <- get_background("random")
##D 
##D occ_train <- kfold_data(abalistes, occ, folds$species, k=1, training=TRUE)
##D occ_test <- kfold_data(abalistes, occ, folds$species, k=1, training=FALSE)
##D bg_train <- kfold_data(abalistes, bg, folds$background, k=1, training=TRUE)
##D bg_test <- kfold_data(abalistes, bg, folds$background, k=1, training=FALSE)
## End(Not run)



