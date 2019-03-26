library(rgeos)


### Name: RGEOS Utility Functions
### Title: RGEOS Utility Functions
### Aliases: getScale setScale translate checkP4S version_GEOS
###   version_GEOS0 set_RGEOS_polyThreshold get_RGEOS_polyThreshold
###   set_RGEOS_warnSlivers get_RGEOS_warnSlivers set_RGEOS_dropSlivers
###   get_RGEOS_dropSlivers rgeos_extSoftVersion
### Keywords: spatial

### ** Examples

	readWKT("POINT(1.5 1.5)")

	# With scale set to 1, the following point will be rounded
	setScale(1)
	readWKT("POINT(1.5 1.5)")
	
	setScale(10)
	readWKT("POINT(1.5 1.5)")
	
	getScale()
	# Set scale option back to default
	setScale()
	
	
	
	# scale option only affect objects when they are translated through rgeos
	setScale(1)
	library(sp)
	SpatialPoints(data.frame(x=1.5,y=1.5))
	translate( SpatialPoints(data.frame(x=1.5,y=1.5)) )
	
	setScale()

        # added example of scale impact on intersection 120905
sline1 <- readWKT(readLines(system.file("wkts/sline1.wkt", package="rgeos")))
sline2 <- readWKT(readLines(system.file("wkts/sline2.wkt", package="rgeos")))
rslt <- gIntersection(sline1, sline2)
class(rslt)
getScale()
setScale(1e+6)
rslt <- gIntersection(sline1, sline2)
class(rslt)
sapply(slot(rslt, "lines"), function(x) length(slot(x, "Lines")))
rslt <- gLineMerge(rslt, byid=TRUE)
sapply(slot(rslt, "lines"), function(x) length(slot(x, "Lines")))
setScale()
get_RGEOS_dropSlivers()
get_RGEOS_warnSlivers()
get_RGEOS_polyThreshold()
# Robert Hijmans difficult intersection case
load(system.file("test_cases/polys.RData", package="rgeos"))
try(res <- gIntersection(a, b, byid=TRUE))
res <- gIntersection(a, b, byid=TRUE, drop_lower_td=TRUE)
sort(unlist(sapply(slot(res, "polygons"), function(p) sapply(slot(p, "Polygons"), slot, "area"))))
oT <- get_RGEOS_polyThreshold()
oW <- get_RGEOS_warnSlivers()
oD <- get_RGEOS_dropSlivers()
set_RGEOS_polyThreshold(1e-3)
set_RGEOS_warnSlivers(TRUE)
res1 <- gIntersection(a, b, byid=TRUE, drop_lower_td=TRUE)
sort(unlist(sapply(slot(res, "polygons"), function(p) sapply(slot(p, "Polygons"), slot, "area"))))
set_RGEOS_dropSlivers(TRUE)
res2 <- gIntersection(a, b, byid=TRUE, drop_lower_td=TRUE)
sort(unlist(sapply(slot(res, "polygons"), function(p) sapply(slot(p, "Polygons"), slot, "area"))))
set_RGEOS_dropSlivers(FALSE)
oo <- gUnaryUnion(res1, c(rep("1", 3), "2", "3", "4"))
unlist(sapply(slot(oo, "polygons"), function(p) sapply(slot(p, "Polygons"), slot, "area")))
ooo <- gIntersection(b, oo, byid=TRUE)
gArea(ooo, byid=TRUE)
unlist(sapply(slot(ooo, "polygons"), function(p) sapply(slot(p, "Polygons"), slot, "area")))
set_RGEOS_dropSlivers(TRUE)
ooo <- gIntersection(b, oo, byid=TRUE)
gArea(ooo, byid=TRUE)
unlist(sapply(slot(ooo, "polygons"), function(p) sapply(slot(p, "Polygons"), slot, "area")))
set_RGEOS_polyThreshold(oT)
set_RGEOS_warnSlivers(oW)
set_RGEOS_dropSlivers(oD)



