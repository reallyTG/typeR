
# Print title
cat("\nTesting average_coordinates()\n")

# Calculations
data(psyo_geomean)
mean <- psyosphere::average_coordinates(psyo_geomean,30,"seconds")

# Check results
if (NCOL(mean) != 6) { stop("Not enough columns") }
if (NROW(mean) != 1) { stop("Not rows") }
e <- val_psyo(mean); if (e != "") {stop(e)}
if (round(mean$lon,5) != round(4.929693,5)) { stop("Unexpected value") }
if (round(mean$lat,5) != round(52.30956,5)) { stop("Unexpected value") }



