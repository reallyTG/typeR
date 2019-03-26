library(mopa)


### Name: backgroundGrid
### Title: Create background coordinates from raster object
### Aliases: backgroundGrid

### ** Examples

## Load presences
data(Oak_phylo2)

## Load rasters
destfile <- tempfile()
data.url <- "https://raw.githubusercontent.com/SantanderMetGroup/mopa/master/data/biostack.rda"
download.file(data.url, destfile)
load(destfile, verbose = TRUE)

projection(biostack$baseline) <- CRS("+proj=longlat +init=epsg:4326")
r <- biostack$baseline[[1]]

## Background around a set of coordinates
bg.species <- backgroundGrid(r, Oak_phylo2)
## Background of a subdomain of the study area
bg.subdomain <- backgroundGrid(r, extent(c(-10, 30, 35, 65)))
## Background of the whole study area
bg <- backgroundGrid(r)

# plot(bg$xy)
# plot(bg.subdomain$xy)
# plot(bg.species$xy$H11)
plot(bg.species$xy$H01)




