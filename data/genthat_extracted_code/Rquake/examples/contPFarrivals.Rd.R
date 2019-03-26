library(Rquake)


### Name: contPFarrivals
### Title: Contour Pickfile Arrivals
### Aliases: contPFarrivals
### Keywords: misc

### ** Examples


## Not run: 
##D library(RSEIS)
##D data(GH)
##D data(coso_sta_LLZ)
##D sta = coso_sta_LLZ
##D g1 = GH$pickfile
##D 
##D 
##D proj = GEOmap::setPROJ(type=2, LAT0 =median(sta$lat) , LON0 = median(sta$lon))
##D 
##D 
##D grcol =  grey(seq(from=0.3, to=0.95, length=50))
##D   contPFarrivals(g1, sta, proj=proj,cont=TRUE, POINTS=TRUE,
##D                            image=TRUE , col=grcol,     phase="P",
##D add=FALSE )
##D 
## End(Not run)



