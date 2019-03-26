library(rrr)


### Name: rank_trace
### Title: Rank Trace Plot
### Aliases: rank_trace

### ** Examples

data(tobacco)
tobacco_x <- tobacco[,4:9]
tobacco_y <- tobacco[,1:3]
gamma <- diag(1, dim(tobacco_y)[2])
rank_trace(tobacco_x, tobacco_y)
rank_trace(tobacco_x, tobacco_y, plot = FALSE)
rank_trace(tobacco_x, tobacco_y, type = "cva")

data(pendigits)
digits_features <- pendigits[, -35:-36]
rank_trace(digits_features, digits_features, type = "pca")

library(dplyr)
data(COMBO17)
galaxy <- as_data_frame(COMBO17)
galaxy <- select(galaxy, -starts_with("e."), -Nr, -UFS:-IFD)
galaxy <- na.omit(galaxy)
galaxy_x <- select(galaxy, -Rmag:-chi2red)
galaxy_y <- select(galaxy, Rmag:chi2red)
rank_trace(galaxy_x, galaxy_y, type = "cva")




