library(rrr)


### Name: rrr
### Title: Fit Reduced-Rank Regression Model
### Aliases: rrr

### ** Examples

data(tobacco)
tobacco_x <- tobacco[,4:9]
tobacco_y <- tobacco[,1:3]
rrr(tobacco_x, tobacco_y, rank = 1)

data(pendigits)
digits_features <- pendigits[, -35:-36]
rrr(digits_features, digits_features, type = "pca", rank = 3)

library(dplyr)
data(COMBO17)
galaxy <- as_data_frame(COMBO17)
galaxy <- select(galaxy, -starts_with("e."), -Nr, -UFS:-IFD)
galaxy <- na.omit(galaxy)
galaxy_x <- select(galaxy, -Rmag:-chi2red)
galaxy_y <- select(galaxy, Rmag:chi2red)
rrr(galaxy_x, galaxy_y, type = "cva", rank = 2)

data(iris)
iris_x <- iris[,1:4]
iris_y <- iris[5]
rrr(iris_x, iris_y, type = "lda")




