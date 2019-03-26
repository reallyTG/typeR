library(meteo)


### Name: regdata
### Title: Dynamic and static covariates for spatio-temporal regression
###   kriging
### Aliases: regdata regdata
### Keywords: datasets

### ** Examples

data(regdata)
str(regdata)
library(sp) # spplot
library(spacetime) # stplot

stplot(regdata[,,'modis']) # plot modis data

spplot(regdata@sp,zcol='twi', col.regions = bpy.colors() ) # plot TWI

spplot(regdata@sp,zcol='dem', col.regions = bpy.colors() ) # plot dem



