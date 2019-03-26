library(rrr)


### Name: residuals
### Title: Reduced-Rank Regression Residuals
### Aliases: residuals

### ** Examples

data(tobacco)
tobacco_x <- tobacco[,4:9]
tobacco_y <- tobacco[,1:3]
tobacco_rrr <- rrr(tobacco_x, tobacco_y, rank = 1)
residuals(tobacco_x, tobacco_y, rank = 1, plot = FALSE)
residuals(tobacco_x, tobacco_y, rank = 1)

library(dplyr)
data(COMBO17)
galaxy <- as_data_frame(COMBO17)
galaxy <- select(galaxy, -starts_with("e."), -Nr, -UFS:-IFD)
galaxy <- na.omit(galaxy)
galaxy_x <- select(galaxy, -Rmag:-chi2red)
galaxy_y <- select(galaxy, Rmag:chi2red)
residuals(galaxy_x, galaxy_y, type = "cva", rank = 2, k = 0.001)




