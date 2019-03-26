library(GSIF)


### Name: spc
### Title: Derive Spatial Predictive Components
### Aliases: spc spc,SpatialPixelsDataFrame,formula-method
###   spc,list,list-method
### Keywords: methods

### ** Examples

# load data:
library(plotKML)
library(sp)

pal = rev(rainbow(65)[1:48])
data(eberg_grid)
gridded(eberg_grid) <- ~x+y
proj4string(eberg_grid) <- CRS("+init=epsg:31467")
formulaString <- ~ PRMGEO6+DEMSRT6+TWISRT6+TIRAST6
eberg_spc <- spc(eberg_grid, formulaString)
names(eberg_spc@predicted) # 11 components on the end;
## Not run: 
##D # plot maps:
##D rd = range(eberg_spc@predicted@data[,1], na.rm=TRUE)
##D sq = seq(rd[1], rd[2], length.out=48)
##D spplot(eberg_spc@predicted[1:4], at=sq, col.regions=pal)
## End(Not run)



