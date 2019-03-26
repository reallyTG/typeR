library(surveillance)


### Name: unionSpatialPolygons
### Title: Compute the Unary Union of '"SpatialPolygons"'
### Aliases: unionSpatialPolygons
### Keywords: spatial

### ** Examples

## Load districts of Germany
load(system.file("shapes", "districtsD.RData", package = "surveillance"))
plot(districtsD, border = "gray")

## Union these districts using either "rgeos" or "polyclip"
if (requireNamespace("rgeos"))  {
    stateD <- unionSpatialPolygons(districtsD, method = "rgeos")
    plot(stateD, add = TRUE, border = 2, lwd = 2)
}
if (requireNamespace("polyclip")) {
    stateD_pc <- unionSpatialPolygons(districtsD, method = "polyclip")
    plot(stateD_pc, add = TRUE, border = 1, lwd = 2, lty = 2)
}



