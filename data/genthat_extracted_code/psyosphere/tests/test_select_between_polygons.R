
# Print title
cat("\nTesting select_between_polygons()\n")

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
# plot <- psyosphere::plot_tracks(psyo_rounds, zoom = 17, t_id = "")
# plot

# Add start and finish polyon
# plot <- psyosphere::plot_polygon(polygon_start, plot = plot)
# plot <- psyosphere::plot_polygon(polygon_finish, plot = plot)
# plot
# remove(plot)

# Select data between polygon
psyo_rounds <- psyosphere::select_between_polygons(
  psyo_rounds, polygon_start, polygon_finish
)

# Plot the remaining data
# plot <- psyosphere::plot_tracks(psyo_rounds, zoom = 17, t_id = "")
# plot <- psyosphere::plot_polygon(polygon_start, plot = plot)
# plot <- psyosphere::plot_polygon(polygon_finish, plot = plot)
# plot

# Check results
# if (!ggplot2::is.ggplot(plot)) {
#   stop("plot is not a ggplot variable")
# }
psyo_rounds <- psyosphere::t_distance(psyo_rounds)
if (NROW(psyo_rounds) != 715) { stop("Wrong number of observations") }
if (NCOL(psyo_rounds) != 11) { stop("Wrong number variables") }
e <- val_psyo(psyo_rounds); if (e != "") {stop(e)}
sum <- sum(psyo_rounds[,c("distances_in_m")], na.rm = TRUE)
if ( round(sum,3) != round(1375.08331638578,3) ) {
  stop("Distance sum is wrong")
}

