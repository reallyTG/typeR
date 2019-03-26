library(nlme)


### Name: Variogram.corRatio
### Title: Calculate Semi-variogram for a corRatio Object
### Aliases: Variogram.corRatio
### Keywords: models

### ** Examples

cs1 <- corRatio(7, form = ~ Time | Rat)
cs1 <- Initialize(cs1, BodyWeight)
Variogram(cs1)[1:10,]



