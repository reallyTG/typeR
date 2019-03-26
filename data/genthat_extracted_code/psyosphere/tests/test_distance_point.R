
# Print title
cat("\nTesting distance_point()\n")

rm(list = ls(all.names = TRUE))
data(psyo)
psyo[,"id"] <- as.character(psyo[,"id"])

# Test un-named list -----------------------------------------------------------

# Calculations
tracks <- psyo[1,]
point <- c(4.936197, 52.314701)
coordinates <- psyosphere::distance_point(tracks, point, bind = FALSE)

# Check results
if (round(coordinates,0) != 637) {stop("Distance to point wrong")}
rm(tracks, point, coordinates)

# Test named list --------------------------------------------------------------

# Calculations
tracks <- psyo[1,]
point <- c(lat = 52.314701, lon = 4.936197)
coordinates <- psyosphere::distance_point(tracks, point, bind = FALSE)

# Check results
if (round(coordinates,0) != 637) {stop("Distance to point wrong")}
rm(tracks, point, coordinates)

# Test matrix --------------------------------------------------------------

# Calculations
tracks <- psyo[1,]
point <- as.matrix(data.frame(lon = 4.936197, lat = 52.314701))
coordinates <- psyosphere::distance_point(tracks, point, bind = FALSE)

# Check results
if (round(coordinates,0) != 637) {stop("Distance to point wrong")}
rm(tracks, point, coordinates)

# Test data.frame --------------------------------------------------------------

# Calculations
point <- data.frame(lon = 4.936197, lat = 52.314701)
coordinates <- psyosphere::distance_point(psyo, point)

# Check results
if (NCOL(coordinates) != 6) { stop("Not enough columns") }
if (NROW(coordinates) != 15) { stop("Not rows") }
e <- psyosphere::val_psyo(coordinates); if (e != "") {stop(e)}
sum_dis <- sum(coordinates$dis_to_point_in_m)
if (round(sum_dis,7) != round(35591.797077915,7)) {
  stop("Result not as expected.")
}
rm(e, sum_dis, point, coordinates)
