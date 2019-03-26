library(marinespeed)


### Name: kfold_grid
### Title: Create k grid based folds for cross-validation
### Aliases: kfold_grid

### ** Examples

set.seed(42)
lonlat_data <- cbind(runif(11, -180, 180), runif(11, -90, 90))
folds <- kfold_grid(lonlat_data, k = 4)
plot_folds(lonlat_data, folds)

# for x,y data
xy_data <- cbind(runif(11, 0, 100), runif(11, 0, 100))
folds <- kfold_grid(xy_data, k = 4, lonlat = FALSE)
plot_folds(xy_data, folds)




