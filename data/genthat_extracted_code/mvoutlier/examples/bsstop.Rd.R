library(mvoutlier)


### Name: bsstop
### Title: Top Layer of the BSS Data
### Aliases: bsstop
### Keywords: datasets

### ** Examples

data(bsstop)
# classical versus robust correlation
corr.plot(log(bsstop[, "Al2O3_T"]), log(bsstop[, "Na2O_T"]))



