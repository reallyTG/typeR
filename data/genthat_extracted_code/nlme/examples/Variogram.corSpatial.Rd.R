library(nlme)


### Name: Variogram.corSpatial
### Title: Calculate Semi-variogram for a corSpatial Object
### Aliases: Variogram.corSpatial
### Keywords: models

### ** Examples

cs1 <- corExp(3, form = ~ Time | Rat)
cs1 <- Initialize(cs1, BodyWeight)
Variogram(cs1, FUN = function(x, y) (1 - exp(-x/y)))[1:10,]



