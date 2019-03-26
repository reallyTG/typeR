
# Print title
cat("\nTesting distance_line()\n")

# Calculations

# Get data
data(psyo_rounds)
psyo_rounds <- psyosphere::select_test_sample(psyo_rounds, 10)

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
psyo_rounds <- psyosphere::select_between_polygons(
  psyo_rounds, polygon_start, polygon_finish
)

# Finish line
finish <- data.frame(lon = c(6.851810,6.851000), lat = c(52.241800,52.240300))

# Calculate line distance
psyo_rounds <- psyosphere::distance_line(psyo_rounds,finish, TRUE)
sum_distance <- sum(psyo_rounds$distances_to_line)

# Check results
if (NCOL(psyo_rounds) != 11) { stop("Wronge number of columns") }
if (NROW(psyo_rounds) != 30) { stop("Not rows") }
e <- val_psyo(psyo_rounds); if (e != "") {stop(e)}
if (round(sum_distance,2) != round(187.9149,2)) {
  stop("Value not as expected")
}
