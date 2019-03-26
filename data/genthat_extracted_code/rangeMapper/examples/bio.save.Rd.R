library(rangeMapper)


### Name: bio.save
### Title: Import 'BIO' tables to a 'rangeMapper' project.
### Aliases: bio.save bio.merge metadata2bio

### ** Examples


require(rangeMapper)
require(rgdal)
wd = setwd(tempdir())
r = readOGR(system.file(package = "rangeMapper",
	"extdata", "wrens", "vector_combined"), "wrens", verbose = FALSE)
dbcon = rangeMap.start(file = "wrens.sqlite", overwrite = TRUE,
	dir = tempdir() )
global.bbox.save(con = dbcon, bbox = r)
gridSize.save(dbcon, gridSize = 2)
canvas.save(dbcon)
processRanges(spdf = r, con =  dbcon, ID = "sci_name" )

# Upload BIO tables
data(wrens)
Troglodytes  = wrens[grep("Troglodytes", wrens$sci_name), c(2, 5)]
bio.save(con = dbcon, loc = Troglodytes,  ID = "sci_name")

setwd(wd)


## Not run: 
##D require(rangeMapper)
##D require(rgdal)
##D wd = setwd(tempdir())
##D r = readOGR(system.file(package = "rangeMapper",
##D   "extdata", "wrens", "vector_combined"), "wrens", verbose = FALSE)
##D dbcon = rangeMap.start(file = "wrens.sqlite", overwrite = TRUE,
##D 	dir = tempdir() )
##D global.bbox.save(con = dbcon, bbox = r)
##D gridSize.save(dbcon, gridSize = 2)
##D canvas.save(dbcon)
##D processRanges(spdf = r, con =  dbcon, ID = "sci_name", metadata = rangeTraits() )
##D 
##D wrensPath = system.file(package = "rangeMapper", "data", "wrens.csv")
##D bio.save(con = dbcon, loc = wrensPath,  ID = "sci_name")
##D bio.merge(dbcon, "wrensNew")
##D metadata2bio(dbcon)
##D setwd(wd)
##D 
## End(Not run)





