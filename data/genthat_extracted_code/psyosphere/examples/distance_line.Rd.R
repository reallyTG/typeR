library(psyosphere)


### Name: distance_line
### Title: Add shortest distance to a line
### Aliases: distance_line

### ** Examples
## No test: 
# Get data
data(psyo_rounds)

# Set start and finish
lon <- c(6.849975, 6.849627, 6.850001, 6.850350, 6.849975)
lat <- c(52.241745, 52.241100, 52.241004, 52.241649, 52.241745)
polygon_start <- data.frame(lon, lat)
remove(lon, lat)

lon <- c(6.851810, 6.851000, 6.851489, 6.852296, 6.851810)
lat <- c(52.241800, 52.240300, 52.240163, 52.241657, 52.241794)
polygon_finish <- data.frame(lon, lat)
remove(lon, lat)

# Select between start and finish
psyo_rounds <- select_between_polygons(
  psyo_rounds, polygon_start, polygon_finish
)

# Finish line
finish <- data.frame(lon = c(6.851810,6.851000), lat = c(52.241800,52.240300))

# Plot tracks, selection polygons and finish line
plot <- plot_tracks(psyo_rounds, t_id = "")
plot <- plot_polygon(polygon_start, plot = plot)
plot <- plot_polygon(polygon_finish, plot = plot)
plot_line(finish, plot = plot)

# Add distance to line to dataframe
psyo_rounds <- distance_line(psyo_rounds,finish, TRUE)
## End(No test)


