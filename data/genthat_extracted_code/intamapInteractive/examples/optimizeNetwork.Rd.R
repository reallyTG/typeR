library(intamapInteractive)


### Name: optimizeNetwork
### Title: Optimization of networks
### Aliases: optimizeNetwork
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
##D  optimOK <- optimizeNetwork(meuse, meuse.grid, candidates = candidates,
##D   method= "ssa", action= "add", nDiff = 20, model = vfitOK, criterion="MUKV",
##D   nr_iterations=10000, nmax=40)
##D 
##D 
##D # add 20 more points assuming UK model (SSA method):
##D optimUK <- optimizeNetwork(meuse, meuse.grid, candidates = candidates,
##D    method = "ssa", action = "add", nDiff = 20, model=vfitUK, criterion="MUKV",
##D    nr_iterations = 10000, nmax = 40, formulaString = zinc~x+y)
##D 
##D # add 20 more points with auxiliary variables (SSA method):
##D optimRK <- optimizeNetwork(meuse, meuse.grid, candidates=candidates,
##D    method="ssa", action="add", nDiff=4, model=vfitRK, criterion="MUKV",
##D    nr_iterations=10000, formula=zinc~dist+ffreq+soil, nmax=200)
##D 
##D # add optimally 20 stations from current network with method "spcov"
##D # (spatial coverage method)
##D optimSC = optimizeNetwork(meuse, meuse.grid, candidates, method = "spcov",
##D             action = "add", nDiff = 10, model = model, criterion = "MUKV", plotOptim = TRUE,
##D             nGridCells = 10000,nTry = 100 )
##D 
##D # delete optimally 10 stations from current network with method "manual"
##D optimMAN = optimizeNetwork(meuse, meuse.grid, candidates, method = "manual",
##D             action = "del", nDiff = 10, model = model, criterion = "MUKV", plotOptim = TRUE )
##D 
##D 
##D # comparison of results with ordinary kriging variogram, otherwise add formulaString
##D # ssa method, assuming ordinary kriging
##D calculateMukv(optimOK, predGrid, vfitOK) 
##D 
##D # ssa method, using spatial location as covariates
##D calculateMukv(optimUK, predGrid, vfitUK, zinc~x+y)
##D  
##D # ssa method, using other variables as covariates
##D calculateMukv(optimRK, predGrid, vfitRK, zinc~dist+ffreq+soil) 
##D 
##D # spcov method
##D calculateMukv(optimSC, predGrid, vfitOK) 
##D 
##D # 10 stations manually deleted
##D calculateMukv(optimMAN, predGrid, vfitOK, zinc~1) 
##D 
## End(Not run)



