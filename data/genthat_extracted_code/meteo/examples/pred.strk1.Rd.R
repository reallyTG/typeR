library(meteo)


### Name: pred.strk1
### Title: Spatio-temporal regression kriging
### Aliases: pred.strk1

### ** Examples

## prepare data
## load observation - data.frame of mean temperatures
data(dtempc) 
str(dtempc)
data(stations)
library(sp)
library(spacetime)
library(gstat)

#str(stations)
## lonmin,lonmax,lonmax, lonmin   latmin, latnmin,latmax,latmax
serbia= point.in.polygon(stations$lon, stations$lat, c(18,22.5,22.5,18), c(40,40,46,46))
st= stations[ serbia!=0, ]
## create STFDF
temp <- meteo2STFDF(dtempc,st)
rm(dtempc)
# str(temp)
## Adding CRS
temp@sp@proj4string <- CRS('+proj=longlat +datum=WGS84')

## load covariates for mean temperatures
data(regdata)
# str(regdata)
regdata@sp@proj4string <- CRS('+proj=longlat +datum=WGS84')

#creating newdata
pred <- data.frame(regdata@sp@coords[1:5,1],regdata@sp@coords[1:5,2], 
                  '2011-07-05', regdata@data$temp_geo[1:5], regdata@data$modis[1:5], 
                  regdata@sp@data$dem[1:5], regdata@sp@data$twi[1:5])
## pred names
names(pred)=c("x", "y", "time", "temp_geo", "modis", "dem", "twi")

#creating observation
gg <- regdata
time <- gg@time
gg@data$dem = rep(gg@sp@data[,1],length(time))
gg@data$twi = rep(gg@sp@data[,2],length(time))

temp_geo <- sapply(1:length(time),
                function(i) over(temp@sp,as(gg[,i,'temp_geo'],'SpatialPixelsDataFrame')))
modis <- sapply(1:length(time),
                function(i) over(temp@sp,as(gg[,i,'modis'],'SpatialPixelsDataFrame' ) ) )
dem <- sapply(1:length(time),
              function(i) over(temp@sp,as(gg[,i,'dem'],'SpatialPixelsDataFrame' ) ) )
twi <- sapply(1:length(time),
                function(i) over(temp@sp,as(gg[,i,'twi'],'SpatialPixelsDataFrame' ) ) )

temp_geo <- do.call('cbind',temp_geo)
temp_geo <- as.vector(temp_geo)
modis <- do.call('cbind',modis)
modis <- as.vector(modis)
dem <- do.call('cbind',dem)
dem <- as.vector(dem)
twi <- do.call('cbind',twi)
twi <- as.vector(twi)

t1 <- which(as.character(index(time[1])) == as.character( index(temp@time)) )
t2 <- which(as.character(index(time[ length(time) ])) == as.character(index(temp@time)) )

temp <- temp[,t1:t2, drop=FALSE]

temp$temp_geo = temp_geo
temp$modis = modis
temp$dem = dem
temp$twi = twi

obs = as.data.frame(temp)[,c(7,4,11,12,13,14,15)]

# Calculate prediction of points in pred data frame
# global model is used for regression and variogram
# load precalculated variograms
data(tvgms)
data(tregcoef)
res= pred.strk1(obs,st, newdata= pred, 
              reg.coef=tregcoef[[1]] ,vgm.model=tvgms[[1]], returnList=TRUE )

#str(res)

# res1= pred.strk1(obs,st, newdata= pred, reg.coef=tregcoef[[1]] ,vgm.model=tvgms[[1]], 
#               returnList=FALSE, out.remove=TRUE, threshold.res=15 )

# str(res1)




