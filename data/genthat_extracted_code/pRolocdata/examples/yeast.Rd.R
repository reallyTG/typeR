library(pRolocdata)


### Name: yeast2018
### Title: Saccharomyces cerevisiae spatial proteomics (2018)
### Aliases: yeast2018
### Keywords: datasets

### ** Examples

data(yeast2018)

library("pRoloc")
par(mfrow = c(1, 2))
plot2D(yeast2018, main = "Markers")
addLegend(yeast2018, where = "bottomleft", cex = .7)
plot2D(yeast2018, fcol = "predicted.location", main = "Localisation")



