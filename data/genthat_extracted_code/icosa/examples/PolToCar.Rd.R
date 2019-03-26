library(icosa)


### Name: PolToCar
### Title: Conversion of spherical coordinates to 3d Cartesian coordinates
### Aliases: PolToCar

### ** Examples

longLat <- rbind(
    c(0,0),
    #note the precision here!
    c(0, 90),
    c(-45,12)
)

xyz <- PolToCar(longLat)



