library(DFIT)


### Name: PlotNcdif
### Title: Plot the item characteristic (expected score) curve for focal
###   and reference groups for the iiItem along with a representation of
###   the focal group density.
### Aliases: PlotNcdif

### ** Examples


data(dichotomousItemParameters)
# # Non Uniform - != guess DIF item close to focal distribution
PlotNcdif(iiItem = 46, itemParameters = dichotomousItemParameters, irtModel = "3pl",
          plotDensity = FALSE, main = "Item 46 Non uniform and different guessing DIF. 3PL")

# # Non Uniform - != guess DIF item far from focal distribution
PlotNcdif(iiItem = 38, itemParameters = dichotomousItemParameters, irtModel = "3pl",
          plotDensity = FALSE, main = "Item 38 Non uniform and different guessing DIF. 3PL")




