library(pedometrics)


### Name: vgmLags
### Title: Lag-distance classes for variogram estimation
### Aliases: vgmLags

### ** Examples

data(meuse, package = "sp")
lags_points <- vgmLags(coords = meuse[, 1:2], count = "points")
lags_pairs <- vgmLags(coords = meuse[, 1:2], count = "pairs")



