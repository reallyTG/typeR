library(gstat)


### Name: fit.variogram.reml
### Title: REML Fit Direct Variogram Partial Sills to Data
### Aliases: fit.variogram.reml
### Keywords: models

### ** Examples

library(sp)
data(meuse)
fit.variogram.reml(log(zinc)~1, ~x+y, meuse, model = vgm(1, "Sph", 900,1))



