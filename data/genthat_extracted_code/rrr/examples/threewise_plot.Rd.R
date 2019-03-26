library(rrr)


### Name: threewise_plot
### Title: 3-D Reduced Rank Regression Plots
### Aliases: threewise_plot

### ** Examples

## Not run: 
##D data(pendigits)
##D digits_features <- pendigits[, -35:-36]
##D threewise_plot(digits_features, digits_class, type = "pca", k = 0.0001)
##D 
##D library(dplyr)
##D data(COMBO17)
##D galaxy <- as_data_frame(COMBO17)
##D galaxy <- select(galaxy, -starts_with("e."), -Nr, -UFS:-IFD)
##D galaxy <- na.omit(galaxy)
##D galaxy_x <- select(galaxy, -Rmag:-chi2red)
##D galaxy_y <- select(galaxy, Rmag:chi2red)
##D threewise_plot(galaxy_x, galaxy_y, type = "cva")
##D 
##D data(iris)
##D iris_x <- iris[,1:4]
##D iris_y <- iris[5]
##D threewise_plot(iris_x, iris_y, type = "lda")
## End(Not run)




