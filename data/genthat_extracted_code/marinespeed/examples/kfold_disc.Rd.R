library(marinespeed)


### Name: kfold_disc
### Title: Create k disc based folds for cross-validation
### Aliases: kfold_disc

### ** Examples

set.seed(42)
lonlat_data <- cbind(runif(11, -180, 180), runif(11, -90, 90))
folds <- kfold_disc(lonlat_data, k = 5)
plot_folds(lonlat_data, folds)

# use the euclidean distance
xy_data <- cbind(runif(11, 0, 100), runif(11, 0, 100))
folds <- kfold_disc(xy_data, k = 5, lonlat = FALSE)
plot_folds(xy_data, folds)




