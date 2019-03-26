library(surveillance)


### Name: polyAtBorder
### Title: Indicate Polygons at the Border
### Aliases: polyAtBorder
### Keywords: spatial

### ** Examples

## Load districts of Germany
load(system.file("shapes", "districtsD.RData", package = "surveillance"))

## Determine districts at the border and check the result on the map
if (requireNamespace("rgeos")) {
    atBorder <- polyAtBorder(districtsD, method = "rgeos")
    plot(districtsD, col = atBorder)
}

## For method = "polyclip", a higher snapping tolerance is required
## to obtain the correct result
if (requireNamespace("polyclip")) {
    atBorder <- polyAtBorder(districtsD, snap = 1e-6, method = "polyclip")
    plot(districtsD, col = atBorder)
}



