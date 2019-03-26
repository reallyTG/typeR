library(nlme)


### Name: Variogram.corExp
### Title: Calculate Semi-variogram for a corExp Object
### Aliases: Variogram.corExp
### Keywords: models

### ** Examples

stopifnot(require("stats", quietly = TRUE))
cs1 <- corExp(3, form = ~ Time | Rat)
cs1 <- Initialize(cs1, BodyWeight)
Variogram(cs1)[1:10,]



