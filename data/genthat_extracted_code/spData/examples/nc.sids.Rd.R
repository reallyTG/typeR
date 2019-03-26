library(spData)


### Name: nc.sids
### Title: North Carolina SIDS data
### Aliases: nc.sids ncCR85.nb ncCC89.nb sidspolys sidscents
### Keywords: datasets spdep

### ** Examples

if (requireNamespace("rgdal", quietly = TRUE)) {
  library(rgdal)
  if (requireNamespace("spdep", quietly = TRUE)) {
    library(spdep)
    nc.sids <- readOGR(system.file("shapes/sids.shp", package="spData")[1])
    proj4string(nc.sids) <- CRS("+proj=longlat +ellps=clrk66")
    row.names(nc.sids) <- as.character(nc.sids$FIPS)
    rn <- row.names(nc.sids)
    ncCC89_nb <- read.gal(system.file("weights/ncCC89.gal", package="spData")[1],
                          region.id=rn)
    ncCR85_nb <- read.gal(system.file("weights/ncCR85.gal", package="spData")[1],
                          region.id=rn)
                          
    plot(nc.sids, border="grey")
    plot(ncCR85_nb, coordinates(nc.sids), add=TRUE, col="blue")
    plot(nc.sids, border="grey")
    plot(ncCC89_nb, coordinates(nc.sids), add=TRUE, col="blue")
  }
}



