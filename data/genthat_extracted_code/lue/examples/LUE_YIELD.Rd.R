library(lue)


### Name: LUE_YIELD
### Title: Light Use Efficiency Model to Estimate Crop Yield
### Aliases: LUE_YIELD
### Keywords: datasets

### ** Examples

## Not run: 
##D ## load the data
##D data(fpar)
##D data(par1)
##D data(tmin)
##D LUE_YIELD(fpar,par1,tmin,-2,12,3)
## End(Not run)
library(raster)
fparr <- raster(nc=2, nr=2)
values(fparr)<-runif(ncell(fparr),min =0.2,max= 0.8)
par11<- brick(nc=2, nr=2, nl=2)
values(par11)<-runif(ncell(par11),min =169076.9,max= 924474.6)
tminn <- brick(nc=2, nr=2, nl=2)
values(tminn)<-runif(ncell(tminn),min = 278,max= 281)
LUE_YIELD(fparr,par11,tminn,-2,12,3)



