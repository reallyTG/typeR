library(synoptReg)


### Name: raster_ct2env
### Title: Raster conversion of environmental data based on CT
### Aliases: raster_ct2env

### ** Examples

# Load data (precp_grid)
data(precp_grid)
# Converting our data, but without modifying time period
smode_mslp <- tidy_cuttime_nc(mslp, only_convert = TRUE)
precp_data <- tidy_cuttime_nc(precp_grid, only_convert = TRUE)
# classification performance
smode_clas <- synoptclas(smode_mslp$smode_data, ncomp = 6)
# convert all the precipitation maps based on CT to a raster stack
raster_precp <- raster_ct2env(longitude = precp_grid$lon,
                latitude = precp_grid$lat, clas = smode_clas$clas,
                grid_data = precp_data$smode_data, option = 2)




