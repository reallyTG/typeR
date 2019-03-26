library(rrr)


### Name: scores
### Title: Compute Latent Variable Scores
### Aliases: scores

### ** Examples

data(pendigits)
digits_features <- pendigits[, -35:-36]
scores(digits_features, digits_features, type = "pca", rank = 3)

library(dplyr)
data(COMBO17)
galaxy <- as_data_frame(COMBO17)
galaxy <- select(galaxy, -starts_with("e."), -Nr, -UFS:-IFD)
galaxy <- na.omit(galaxy)
galaxy_x <- select(galaxy, -Rmag:-chi2red)
galaxy_y <- select(galaxy, Rmag:chi2red)
scores(galaxy_x, galaxy_y, type = "cva", rank = 4)

data(iris)
iris_x <- iris[,1:4]
iris_y <- iris[5]
scores(iris_x, iris_y, type = "lda")




