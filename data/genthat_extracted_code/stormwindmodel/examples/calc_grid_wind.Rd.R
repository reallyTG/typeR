library(stormwindmodel)


### Name: calc_grid_wind
### Title: Calculate wind speed at grid points
### Aliases: calc_grid_wind

### ** Examples

## Not run: 
##D data("floyd_tracks")
##D data("county_points")
##D full_track <- create_full_track(hurr_track = floyd_tracks)
##D with_wind_radii <- add_wind_radii(full_track = full_track)
##D wind_grid <- calc_grid_wind(grid_point = county_points[1, ],
##D                             with_wind_radii = with_wind_radii)
##D head(wind_grid)
## End(Not run)




