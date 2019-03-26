library(pRolocdata)


### Name: nikolovski2014
### Title: LOPIMS data from Nikolovski et al. (2014)
### Aliases: nikolovski2014
### Keywords: datasets

### ** Examples

data(nikolovski2014)
pData(nikolovski2014)
library("pRoloc")
plot2D(nikolovski2014)
addLegend(nikolovski2014, where = "topright", bty = "n", cex =.7)

A <- pData(nikolovski2014)$gradient == "A"
par(mfrow = c(1, 2))
plot2D(nikolovski2014[, A], main = "Gradient A")
plot2D(nikolovski2014[, !A], main = "Gradient B")



