library(nlme)


### Name: Variogram.corLin
### Title: Calculate Semi-variogram for a corLin Object
### Aliases: Variogram.corLin
### Keywords: models

### ** Examples

cs1 <- corLin(15, form = ~ Time | Rat)
cs1 <- Initialize(cs1, BodyWeight)
Variogram(cs1)[1:10,]



