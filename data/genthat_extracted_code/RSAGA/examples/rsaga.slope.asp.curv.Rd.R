library(RSAGA)


### Name: rsaga.slope.asp.curv
### Title: Slope, Aspect, Curvature
### Aliases: rsaga.slope.asp.curv
### Keywords: interface spatial

### ** Examples

## Not run: 
##D # Simple slope, aspect, and general curvature in degrees:
##D rsaga.slope.asp.curv("lican.sgrd", "slope", "aspect", "curvature",
##D                      method = "maxslope", unit.slope = "degrees", unit.aspect = "degrees")
##D # same for ASCII grids (default extension .asc):
##D rsaga.esri.wrapper(rsaga.slope.asp.curv,
##D                    in.dem="lican", out.slope="slope",
##D                    out.aspect = "aspect", out.cgene = "curvature",
##D                    method="maxslope", unit.slope = "degrees", unit.aspect = "degrees")
## End(Not run)



