library(BIOMASS)


### Name: getBioclimParam
### Title: Retrieving bioclimatic parameters
### Aliases: getBioclimParam
### Keywords: bioclim internal param

### ** Examples

# One study site
lat <- 4.08
long <- -52.68
coord <- cbind(long, lat)
## Not run: 
##D bioclim <- getBioclimParam(coord)
## End(Not run)

# Several study sites (here three sites)
long <- c(-52.68, -51.12, -53.11)
lat <- c(4.08, 3.98, 4.12)
coord <- cbind(long, lat)
## Not run: 
##D bioclim <- getBioclimParam(coord)
## End(Not run)




