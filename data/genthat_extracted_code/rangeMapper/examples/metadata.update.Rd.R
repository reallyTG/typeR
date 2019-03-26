library(rangeMapper)


### Name: metadata.update
### Title: Updates metadata table
### Aliases: metadata.update

### ** Examples


require(rangeMapper)
require(rgdal)
# data
spdf = readOGR(system.file(package = "rangeMapper",
	"extdata", "wrens", "vector_combined"), "wrens", verbose = FALSE)
rloc = system.file(package = "rangeMapper", "extdata",
	"etopo1", "etopo1_Americas.tif")
r = readGDAL(rloc, output.dim = c(50, 50))
spdf = spTransform(spdf, CRS(proj4string(r)) )

# the project
dbcon = rangeMap.start(file = "wrens.sqlite", overwrite = TRUE,
	dir = tempdir() )
rmap = new("rangeMap", CON = dbcon)
global.bbox.save(con = dbcon, bbox = spdf )
gridSize.save(dbcon, gridSize = 300000)
canvas.save(dbcon)
processRanges(spdf = spdf, con =  dbcon, ID = "sci_name" )

# metadata.update
metadata.update (rmap,
 FUN = function(x, ...) {
 	res = diff(range(x, ...))
 	if( !is.finite(res)) res = 0
 	res
 	},
	name = 'AltitudeRange', map = r, na.rm = TRUE, overwrite = TRUE)
# plot
mr = dbGetQuery(dbcon, 'select * from metadata_ranges')
maxRangeSp = mr[mr$AltitudeRange== max(mr$AltitudeRange), 'bioid']
image(r)
plot(rangeFetch(rmap, maxRangeSp), add = TRUE, border = 4, lwd = 3)
title(main = maxRangeSp)




