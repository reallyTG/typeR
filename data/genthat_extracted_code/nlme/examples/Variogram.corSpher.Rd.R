library(nlme)


### Name: Variogram.corSpher
### Title: Calculate Semi-variogram for a corSpher Object
### Aliases: Variogram.corSpher
### Keywords: models

### ** Examples

cs1 <- corSpher(15, form = ~ Time | Rat)
cs1 <- Initialize(cs1, BodyWeight)
Variogram(cs1)[1:10,]



