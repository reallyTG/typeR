library(marinespeed)


### Name: kfold_data
### Title: Get the data associated with a fold
### Aliases: kfold_data

### ** Examples

## random data folds
set.seed(42)
occ_data <- data.frame(species = rep("Abalistes stellatus", 50),
                       longitude = runif(50, -180, 180), latitude = runif(50, -90, 90))
bg_data <- data.frame(species = rep("background", 1000),
                      longitude = runif(1000, -180, 180), latitude = runif(1000, -90, 90))
folds <- kfold_occurrence_background(occ_data, bg_data)
## alternative with real data (but see also the function get_fold_data)
# occ_data <- get_occurrences("Abalistes stellatus")
# bg_data <- load_background("random")
# folds <- load_folds("random")

## get training and test data for the first fold
occ_training <- kfold_data("Abalistes stellatus", occ_data, folds$occurrence,
                           fold = 1, training = TRUE)
occ_test <- kfold_data("Abalistes stellatus", occ_data, folds$occurrence,
                       fold = 1, training = FALSE)

bg_training <- kfold_data("Abalistes stellatus", bg_data, folds$background,
                          fold = 1, training = TRUE)
bg_test <- kfold_data("Abalistes stellatus", bg_data, folds$background,
                      fold = 1, training = FALSE)




