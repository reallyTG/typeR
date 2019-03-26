library(stormwindmodel)


### Name: add_storm_track
### Title: Plot Atlantic basin hurricane tracks
### Aliases: add_storm_track

### ** Examples

## Not run: 
##D library(ggplot2)
##D data("county_points")
##D data("floyd_tracks")
##D grid_winds_floyd <- get_grid_winds(hurr_track = floyd_tracks,
##D                                    grid_df = county_points)
##D floyd_map <- map_wind(grid_winds_floyd, value = "vmax_sust",
##D                       wind_metric = "knots") +
##D              ggtitle("Maximum sustained wind speeds")
##D add_storm_track(floyd_tracks, plot_object = floyd_map)
## End(Not run)




