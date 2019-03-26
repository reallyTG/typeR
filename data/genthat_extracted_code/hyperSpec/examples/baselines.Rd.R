library(hyperSpec)


### Name: spc.fit.poly
### Title: Polynomial Baseline Fitting These functions fit polynomal
###   baselines.
### Aliases: spc.fit.poly spc.fit.poly.below
### Keywords: datagen manip

### ** Examples


## Not run: vignette ("baseline", package = "hyperSpec")

spc <- chondro [1 : 10]
baselines <- spc.fit.poly(spc [,, c (625 ~ 640, 1785 ~ 1800)], spc)
plot(spc - baselines)


baselines <- spc.fit.poly.below (spc)
plot (spc - baselines)

spc.fit.poly.below(chondro [1:3], debuglevel = 1)
spc.fit.poly.below(chondro [1:3], debuglevel = 2)
spc.fit.poly.below(chondro [1:3], debuglevel = 3, noise = sqrt (rowMeans (chondro [[1:3]])))




