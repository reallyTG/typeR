library(psyosphere)


### Name: select_between_polygons
### Title: Select tracks between two polygons.
### Aliases: select_between_polygons

### ** Examples
## No test: 
# Create polygons
lon <- c(6.849975, 6.849627, 6.850001, 6.850350, 6.849975)
lat <- c(52.241745, 52.241100, 52.241004, 52.241649, 52.241745)
polygon_start <- data.frame(lon, lat)
remove(lon, lat)

lon <- c(6.851810, 6.851000, 6.851489, 6.852296, 6.851810)
lat <- c(52.241800, 52.240300, 52.240163, 52.241657, 52.241794)
polygon_finish <- data.frame(lon, lat)
remove(lon, lat)

# Get a track
data(psyo_rounds)

# Plot tracks
plot <- plot_tracks(psyo_rounds, zoom = 17, t_id = "")
plot

# Add start and finish polyon
plot <- plot_polygon(polygon_start, plot = plot)
plot_polygon(polygon_finish, plot = plot)

# Select data between polygon
psyo_rounds <- select_between_polygons(
  psyo_rounds, polygon_start, polygon_finish
)

# Plot the remaining data
plot <- plot_tracks(psyo_rounds, t_id = "")
plot <- plot_polygon(polygon_start, plot = plot)
plot_polygon(polygon_finish, plot = plot)
## End(No test)


