library(lue)


### Name: LUE_YIELD_VPD
### Title: Light Use Efficiency Model to Estimate Crop Yield with Vapour
###   Pressure Deficit
### Aliases: LUE_YIELD_VPD
### Keywords: datasets

### ** Examples

## Not run: 
##D ## load the data
##D data(fpar)
##D data(par1)
##D data(tmin)
##D data(tmax)
##D data(tdew)
##D LUE_YIELD_VPD(fpar,par1,tmin,tmax,tdew,-2,12,1.5,4,3)
## End(Not run)
library(raster)
fparr <- raster(nc=2, nr=2)
values(fparr)<-runif(ncell(fparr),min =0.2,max= 0.8)
par11<- brick(nc=2, nr=2, nl=2)
values(par11)<-runif(ncell(par11),min =169076.9,max= 924474.6)
tminn <- brick(nc=2, nr=2, nl=2)
values(tminn)<-runif(ncell(tminn),min = 278,max= 281)
tmaxx <- brick(nc=2, nr=2, nl=2)
values(tmaxx)<-runif(ncell(tmaxx),min = 278,max= 281)
tdeww <- brick(nc=2, nr=2, nl=2)
values(tdeww)<-runif(ncell(tdeww),min = 278,max= 281)
LUE_YIELD_VPD(fparr,par11,tminn,tmaxx,tdeww,-2,12,1.5,4,3)



