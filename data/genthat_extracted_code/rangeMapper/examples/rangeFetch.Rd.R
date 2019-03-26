library(rangeMapper)


### Name: rangeFetch
### Title: rangeFetch Range extractor
### Aliases: rangeFetch

### ** Examples


wd = setwd(tempdir())
require(rangeMapper)
require(rgdal)
spdf = readOGR(system.file(package = "rangeMapper", "extdata",
	"wrens", "vector_combined"), "wrens", verbose = FALSE)
dbcon = rangeMap.start(file = "wrens.sqlite",
	overwrite = TRUE, dir = tempdir() )
rmo = rangeMap("wrens.sqlite")
global.bbox.save(con = dbcon, bbox = spdf)
gridSize.save(dbcon, gridSize = 3)
canvas.save(dbcon)
processRanges(spdf = spdf, con =  dbcon, ID = "sci_name" )
rangeMap.save(dbcon)

house_wren = rangeFetch(rmo, "Troglodytes_aedon")
image(rangeMap.fetch(dbcon))
plot(house_wren, add = TRUE, border = 'blue', lwd = 2)
setwd(wd)




