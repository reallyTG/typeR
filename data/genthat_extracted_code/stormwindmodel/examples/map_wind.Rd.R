library(stormwindmodel)


### Name: map_wind
### Title: Map wind exposure at the county level
### Aliases: map_wind

### ** Examples

## Not run: 
##D data("katrina_tracks")
##D data("county_points")
##D grid_winds_katrina <- get_grid_winds(hurr_track = katrina_tracks,
##D                                      grid_df = county_points)
##D map_wind(grid_winds_katrina)
##D map_wind(grid_winds_katrina, wind_metric = "knots")
##D map_wind(grid_winds_katrina, value = "vmax_gust")
##D map_wind(grid_winds_katrina, break_point = 20)
## End(Not run)




