library(nlme)


### Name: Variogram.corGaus
### Title: Calculate Semi-variogram for a corGaus Object
### Aliases: Variogram.corGaus
### Keywords: models

### ** Examples

cs1 <- corGaus(3, form = ~ Time | Rat)
cs1 <- Initialize(cs1, BodyWeight)
Variogram(cs1)[1:10,]



