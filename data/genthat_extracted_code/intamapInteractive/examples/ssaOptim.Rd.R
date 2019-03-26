library(intamapInteractive)


### Name: ssaOptim
### Title: Spatial simulated annealing (SSA) for optimization of sampling
###   designs using a geostatistical measure of spatial prediction error
### Aliases: ssaOptim
### Keywords: spatial

### ** Examples

## Not run: 
##D # load data:
##D data(meuse)
##D coordinates(meuse) = ~x+y
##D data(meuse.grid)
##D coordinates(meuse.grid) = ~x+y
##D gridded(meuse.grid) = TRUE
##D predGrid = meuse.grid
##D 
##D # estimate variograms (OK/UK):
##D vfitOK = fit.variogram(variogram(zinc~1, meuse), vgm(1, "Exp", 300, 1))
##D vfitUK = fit.variogram(variogram(zinc~x+y, meuse), vgm(1, "Exp", 300, 1))
##D vfitRK = fit.variogram(variogram(zinc~dist+ffreq+soil, meuse), vgm(1, "Exp", 300, 1))
##D 
##D # study area of interest:
##D bb = bbox(predGrid)
##D boun = SpatialPoints(data.frame(x=c(bb[1,1],bb[1,2],bb[1,2],bb[1,1],bb[1,1]),
##D                                 y=c(bb[2,1],bb[2,1],bb[2,2],bb[2,2],bb[2,1])))
##D Srl = Polygons(list(Polygon(boun)),ID = as.character(1))
##D candidates = SpatialPolygonsDataFrame(SpatialPolygons(list(Srl)),
##D                                       data = data.frame(ID=1))
##D 
##D # add 20 more points assuming OK model (SSA method):
##D optimOK <- ssaOptim(meuse, meuse.grid, candidates = candidates, covariates = "over",
##D             nDiff = 20, action = "add", model = vfitOK, nr_iterations = 10000, 
##D             formulaString = zinc~1, nmax = 40, countMax = 200)
##D 
##D # add 20 more points assuming UK model (SSA method):
##D optimUK <- ssaOptim(meuse, meuse.grid, candidates = candidates, covariates = "over",
##D             nDiff = 20, action = "add", model = vfitUK, nr_iterations = 10000, 
##D             formulaString = zinc~x+y, nmax = 40, countMax = 200)
##D 
##D # add 20 more points with auxiliary variables (SSA method):
##D optimRK <- ssaOptim(meuse, meuse.grid, candidates = candidates, covariates = "over",
##D             nDiff = 20, action = "add", model = vfitRK, nr_iterations = 10000, 
##D             formulaString = zinc~dist+ffreq+soil, nmax = 40, countMax = 200)
##D    
## End(Not run)
   


