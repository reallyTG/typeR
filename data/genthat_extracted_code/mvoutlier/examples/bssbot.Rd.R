library(mvoutlier)


### Name: bssbot
### Title: Bottom Layer of the BSS Data
### Aliases: bssbot
### Keywords: datasets

### ** Examples

data(bssbot)
# classical versus robust correlation
corr.plot(log(bssbot[, "Al2O3_B"]), log(bssbot[, "Na2O_B"]))



