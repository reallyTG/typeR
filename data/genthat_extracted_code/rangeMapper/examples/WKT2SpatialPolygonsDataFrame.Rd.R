library(rangeMapper)


### Name: WKT2SpatialPolygonsDataFrame
### Title: Convert WKT polygons to SpatialPolygonsDataFrame
### Aliases: WKT2SpatialPolygonsDataFrame vertices
###   vertices,SpatialPolygons-method

### ** Examples


require(rangeMapper)
require(rgeos)

# generate a few random polygons
randPoly = function(mean, sd) {
  writeWKT(
    gConvexHull(
     readWKT(paste("MULTIPOINT (",
             paste(apply(matrix(rnorm(n= 100, mean, sd), ncol = 2), 1,
             paste, collapse = ' '), collapse = ","), ")"))))
}
n = 50
d = data.frame( nam = sample(letters, n, TRUE),
               range = mapply(randPoly, mean = sample(1:2, n, TRUE),
               sd = sample(1:2/5, n, TRUE) ))


X = WKT2SpatialPolygonsDataFrame(d, 'range', 'nam')


dbcon = rangeMap.start(file = "test.sqlite", overwrite = TRUE, dir = tempdir() )
global.bbox.save(con = dbcon, bbox = X)
gridSize.save(dbcon)
canvas.save(dbcon)
processRanges(spdf = X, con =  dbcon, ID = "nam")
rangeMap.save(dbcon)
plot(rangeMap.fetch(dbcon))

require(rangeMapper)
require(rgdal)
f = system.file(package = "rangeMapper", "extdata", "wrens", "vector")
# path to Campylorhynchus_gularis breeding range:
camgul = selectShpFiles(f, ogr = TRUE, polygons.only = TRUE)[6, ]
r = readOGR(camgul$dsn, camgul$layer)
mp = vertices(r, mean)
v = vertices(r)

plot(r)
points(mp, col = 2, pch = 3, cex = 2)
points(v, pch = 3, cex = .5)




