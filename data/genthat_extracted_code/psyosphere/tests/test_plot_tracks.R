
# Prepare test
cat("\nTesting plot_tracks()\n")
rm(list = ls(all.names = TRUE))

# Testing simple plot ----------------------------------------------------------

# Get data
data(psyo_rounds_map)
data(psyo_rounds2)
map <- psyo_rounds_map
tracks <- psyo_rounds2

# clean-up data
tracks <- average_duplicates(tracks)
tracks <- t_time_difference(tracks)
tracks <- mark_time_gaps(tracks)
tracks <- t_speed(tracks)
tracks <- mark_speed_gaps(tracks, 40)

descriptive <- des_summary(tracks, cgaps = c("speed_gap","time_gap"))

# If the map is outdated, run demo/data/data_psyo_rounds_map.R and build the
# package again.

plot <- plot_tracks(
  tracks, plot = map, cgaps = c("speed_gap","time_gap")
)
plot

# Check results
e <- val_var(plot, "ggplot"); if (e != "") {stop(e)}

# Testing one point ------------------------------------------------------------

point <- data.frame(lon = 0, lat = 0)
plot_point <- plot_tracks(point, plot = map, t_id = "")

# Check results
e <- val_var(plot_point, "ggplot"); if (e != "") {stop(e)}

# Testing reformatting color ---------------------------------------------------

if (psyosphere:::kml_format_color_private("bb00aaff") != "ffaa00bb") {
  stop("Wrong color")
}
