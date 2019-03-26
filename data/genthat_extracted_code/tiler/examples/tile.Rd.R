library(tiler)


### Name: tile
### Title: Create map tiles
### Aliases: tile

### ** Examples

## Don't show: 
tmpfiles <- list.files(tempdir(), full.names = TRUE)
## End(Don't show)
# non-geographic/simple CRS
x <- system.file("maps/map.png", package = "tiler")
tiles <- file.path(tempdir(), "tiles")
tile(x, tiles, "2-3")

# projected map
x <- system.file("maps/map_wgs84.tif", package = "tiler")
tile(x, tiles, 0)
## Don't show: 
unlink(c(tiles, file.path(tempdir(), "preview.html")), recursive = TRUE, force = TRUE)
extrafiles <- setdiff(list.files(tempdir(), full.names = TRUE), tmpfiles)
if(length(extrafiles)) unlink(extrafiles, recursive = TRUE, force = TRUE)
## End(Don't show)



