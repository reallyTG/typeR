library(pRolocdata)


### Name: rodriguez2012r1
### Title: Spatial proteomics of human inducible goblet-like LS174T cells
###   from Rodriguez-Pineiro et al. (2012)
### Aliases: rodriguez-pineiro2012 rodriguez2012 rodriguez2012r1
###   rodriguez2012r2 rodriguez2012r3
### Keywords: datasets

### ** Examples

data(rodriguez2012r1)
data(rodriguez2012r2)
data(rodriguez2012r3)

library("pRoloc")
par(mfrow = c(2, 2))
plot2D(rodriguez2012r1)
addLegend(rodriguez2012r1, cex = .7, where = "topleft")
plot2D(rodriguez2012r2)
plot2D(rodriguez2012r3)


## compare to figure 3
dev.new()
plot2D(markerMSnSet(rodriguez2012r1),
       mirrorX = TRUE, mirrorY = TRUE,
       main = "Our markers")
addLegend(markerMSnSet(rodriguez2012r1), where = "bottomright")



