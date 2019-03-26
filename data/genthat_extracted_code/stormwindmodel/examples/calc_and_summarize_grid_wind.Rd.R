library(stormwindmodel)


### Name: calc_and_summarize_grid_wind
### Title: Calculate and summarize grid winds
### Aliases: calc_and_summarize_grid_wind

### ** Examples

## Not run: 
##D library(dplyr)
##D data(county_points)
##D data("floyd_tracks")
##D full_track <- create_full_track(hurr_track = floyd_tracks, tint = 0.25)
##D with_wind_radii <- add_wind_radii(full_track = full_track)
##D grid_point <- county_points %>% filter(gridid == "37055")
##D grid_wind_summary <- calc_and_summarize_grid_wind(grid_point = grid_point,
##D    with_wind_radii = with_wind_radii, gust_duration_cut = 15,
##D    sust_duration_cut = 15)
## End(Not run)




