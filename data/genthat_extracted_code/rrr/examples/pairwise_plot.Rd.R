library(rrr)


### Name: pairwise_plot
### Title: Pairwise Plots
### Aliases: pairwise_plot

### ** Examples

data(pendigits)
digits_features <- pendigits[,1:34]
digits_class <- pendigits[,35]
pairwise_plot(digits_features, digits_class, type = "pca", pair_x = 1, pair_y = 3)

library(dplyr)
data(COMBO17)
galaxy <- as_data_frame(COMBO17)
galaxy <- select(galaxy, -starts_with("e."), -Nr, -UFS:-IFD)
galaxy <- na.omit(galaxy)
galaxy_x <- select(galaxy, -Rmag:-chi2red)
galaxy_y <- select(galaxy, Rmag:chi2red)
pairwise_plot(galaxy_x, galaxy_y, type = "cva")

data(iris)
iris_x <- iris[,1:4]
iris_y <- iris[5]
pairwise_plot(iris_x, iris_y, type = "lda")




