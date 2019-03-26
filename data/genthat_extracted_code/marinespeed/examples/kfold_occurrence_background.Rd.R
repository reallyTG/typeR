library(marinespeed)


### Name: kfold_occurrence_background
### Title: Create k folds of occurrence and background data for
###   cross-validation
### Aliases: kfold_occurrence_background

### ** Examples

set.seed(42)
occurrence_data <- data.frame(species = rep("Abalistes stellatus", 50),
                              longitude = runif(50, -180, 180),
                              latitude = runif(50, -90, 90))

# REMARK: this is NOT how you would want to create random background point.
# Use special functions for this like dismo::randomPoints, especially for
# lonlat data
background_data <- data.frame(species = rep("background", 500),
                              longitude = runif(500, -180, 180),
                              latitude = runif(500, -90, 90))
disc_folds <- kfold_occurrence_background(occurrence_data, background_data,
                                          "disc")
random_folds <- kfold_occurrence_background(occurrence_data, background_data,
                                            "random", pwd_sample = FALSE,
                                            background_buffer = NA)




