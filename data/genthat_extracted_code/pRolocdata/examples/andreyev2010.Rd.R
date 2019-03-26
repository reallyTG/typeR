library(pRolocdata)


### Name: andreyev2010
### Title: Six sub-cellular fraction data from mouse macrophage-like
###   RAW264.7 cells from Andreyev et al. (2009)
### Aliases: andreyev2010 andreyev2010rest andreyev2010activ
### Keywords: datasets

### ** Examples

data(andreyev2010rest, verbose = TRUE)
data(andreyev2010activ, verbose = TRUE)

library("pRoloc")
par(mfrow = c(1, 2))
plot2D(andreyev2010rest, main = "Resting (control)")
plot2D(andreyev2010activ, main = "Kdo2-lipid A-treated")
addLegend(andreyev2010activ)



