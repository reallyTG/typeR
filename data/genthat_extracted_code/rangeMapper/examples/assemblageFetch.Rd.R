library(rangeMapper)


### Name: assemblageFetch
### Title: Retrieves the species set of an arbitrary canvas cell
### Aliases: assemblageFetch
###   assemblageFetch,rangeMap,SpatialPoints,missing-method
###   assemblageFetch,rangeMap,SpatialPoints,character-method

### ** Examples


require(rangeMapper)
require(rgdal)

projName = "wrens.sqlite"
projLoc = paste(tempdir(), projName, sep = .Platform$file.sep)

dbcon = rangeMap.start(file = projName,dir = tempdir() , overwrite = TRUE)
f = system.file(package = "rangeMapper", "extdata", "wrens", "vector_combined")
r = readOGR(f, "wrens", verbose = FALSE)
global.bbox.save(con = dbcon, bbox = r)
gridSize.save(dbcon, gridSize = 3)
canvas.save(dbcon)
data(wrens)
bio.save(con = dbcon, loc = wrens ,  ID = "sci_name")
processRanges(spdf = r, con =  dbcon, ID = "sci_name")
rangeMap.save(dbcon)

sr = rangeMap.fetch(dbcon)
image(sr, axes = TRUE); grid()

p = list(x = -76.39, y = 9.26)
# or use locator:  p =  locator(1)

xy = SpatialPoints( do.call(cbind, p), proj4string = CRS(proj4string(r)) )
af = assemblageFetch(rangeMap(projLoc) , xy)
points(p, col = 4, cex = 2)
print(af)

af = assemblageFetch(rangeMap(projLoc) , xy, "wrens")
print(af[, c(1, 4, 6:8)])





