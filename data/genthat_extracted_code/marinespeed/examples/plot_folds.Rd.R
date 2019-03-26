library(marinespeed)


### Name: plot_folds
### Title: plot folds
### Aliases: plot_folds

### ** Examples

set.seed(42)
lonlat_data <- cbind(runif(11, -180, 180), runif(11, -90, 90))
folds <- kfold_disc(lonlat_data, k = 5)
plot_folds(lonlat_data, folds)




