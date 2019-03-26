library(meteo)


### Name: pred.strk
### Title: Spatio-temporal regression kriging
### Aliases: pred.strk

### ** Examples

# prepare data
# load observation - data.frame of mean temperatures
data(dtempc) 
# str(dtempc)
data(stations)
library(sp)
library(spacetime)
library(gstat)

# str(stations)
## lonmin,lonmax,lonmax, lonmin   latmin, latnmin,latmax,latmax
serbia= point.in.polygon(stations$lon, stations$lat, c(18,22.5,22.5,18), c(40,40,46,46))
st= stations[ serbia!=0, ]
# create STFDF
temp <- meteo2STFDF(dtempc,st)
rm(dtempc)
# str(temp)
# Adding CRS
temp@sp@proj4string <- CRS('+proj=longlat +datum=WGS84')

# load covariates for mean temperatures
data(regdata)
# str(regdata)
regdata@sp@proj4string <- CRS('+proj=longlat +datum=WGS84')

# Calculate prediction of mean temperatures for "2011-07-05" 
# global model is used for regression and variogram
# load precalculated variograms
data(tvgms)
data(tregcoef)
res= pred.strk(temp,zcol=1, newdata= regdata[,1,drop=FALSE], 
              reg.coef=tregcoef[[1]] ,vgm.model=tvgms[[1]], progress=FALSE )

## plot prediction
# stplot(res$pred, col.regions=bpy.colors())


# t1= temp[regdata@sp,]
# # create fake observations
# t1@data$tempc[seq(1,120,by=8)] =35
# 
# 
# res= pred.strk(t1,zcol=1, newdata= regdata[,1:2], 
#                reg.coef=tregcoef[[1]], vgm.model=tvgms[[1]] , 
#                threshold.res=5, do.cv=T, out.remove = T)
# # plot cross validation residuals 
# stplot(res$cv[,,'resid.cv'] , col.regions=bpy.colors())
# 
# # plot locations of removed stations
# spplot(res$remst, zcol='station_name' , col.regions=bpy.colors())
# #plot removed stations as time-series
# row.names(res$remobs@sp) = res$remst$station_name
# res$remobs[,1:2,c('tempc','pred.cv')]
# stplot(res$remobs[,1:2,c('tempc','pred.cv')], mode='tp')

## Calculate prediction of mean temperature for "2011-07-05" "2011-07-06"
## only MODIS is used as covariate

# modisVGM =vgmST("sumMetric",space=vgm( 18.27, "Sph", 6000, 3.22),
#                                           time =vgm(0, "Sph",  0.1, 0),
#                                           joint=vgm(8.34, "Sph", 2349, 1.80),
#                                           stAni=583)
# attr(modisVGM,"temporal unit") = "days"                                           

# rkmod <-  pred.strk(temp,zcol=1, newdata= STFDF(regdata@sp,
#                time=as.POSIXct("2011-07-05"), endTime=as.POSIXct("2011-07-06"), 
#                data=regdata[,1]@data) , threshold.res=10, 
#              dynamic.cov='modis', static.cov=NULL,
#               reg.coef= c(-0.23,0.7303284),
#               vgm.model= modisVGM  )
                                           
## coefficients and variogram is calculated globally for GSOD and ECA&D obs. for 2011 year 

# stplot(rkmod$pred, col.regions=bpy.colors())

## parallel processing
# library(snowfall)
# rkmod <-  pred.strk(temp,zcol=1, 
#                   newdata= STFDF(regdata@sp,
#                    time=as.POSIXct("2011-07-05"), endTime=as.POSIXct("2011-07-06"), 
#                    data=regdata[,1]@data) ,
#                     threshold.res=10, 
#                     dynamic.cov='modis', static.cov=NULL,
#                     reg.coef= c(-0.23,0.7303284),
#                     vgm.model= modisVGM, parallel.processing=TRUE)




