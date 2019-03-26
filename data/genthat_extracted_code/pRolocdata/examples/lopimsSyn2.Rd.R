library(pRolocdata)


### Name: lopimsSyn2
### Title: LOPIMS data for the Synapter 2.0 paper
### Aliases: lopimsSyn1 lopimsSyn2 lopimsSyn2_0frags
### Keywords: datasets

### ** Examples

data(lopimsSyn1)
data(lopimsSyn2)
data(lopimsSyn2_0frags)

## Visualisation
library("pRoloc")
par(mfrow = c(1, 3))
plot2D(lopimsSyn1, main = "Synapter 1", addLegend = "topleft")
plot2D(lopimsSyn2, main = "Synapter 2")
plot2D(lopimsSyn2_0frags, main = "Synapter 2 (0 fragments)")



