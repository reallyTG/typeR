library(synoptReg)


### Name: raster_clas
### Title: Raster conversion of the Synoptic Classification
### Aliases: raster_clas

### ** Examples

# Load data (mslp)
data(mslp)
# Converting our data, but without modifying time period
smode_mslp <- tidy_cuttime_nc(mslp, only_convert = TRUE)
# classification performance
smode_clas <- synoptclas(smode_mslp$smode_data, ncomp = 6)
# convert all the precipitation maps based on CT to a raster stack
raster_clas(longitude = mslp$lon, latitude = mslp$lat,
            grouped_data = smode_clas$grouped_data)




