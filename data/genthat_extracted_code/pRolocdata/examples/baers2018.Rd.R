library(pRolocdata)


### Name: baers2018
### Title: Synechocystis spatial proteomics
### Aliases: baers2018 synechocystis
### Keywords: datasets

### ** Examples

data(baers2018)

library("pRoloc")
par(mfrow = c(1, 2))
plot2D(baers2018, main = "Markers")
addLegend(baers2018, where = "bottomright")
plot2D(baers2018, fcol = "Localisation", main = "Localisation")



