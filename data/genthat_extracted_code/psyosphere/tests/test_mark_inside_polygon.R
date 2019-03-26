
# Print title
cat("\nTesting mark_inside_polygon()\n")

# Calculations
lon <- c(4.92, 4.93, 4.93, 4.92, 4.92)
lat <- c(52.311, 52.311, 52.308, 52.308, 52.311)
poly <- data.frame(lon, lat)
data(psyo)

psyo <- psyosphere::mark_inside_polygon(psyo, poly)

# Check results
if (NCOL(psyo) != 6) { stop("Not enough columns") }
if (NROW(psyo) != 15) { stop("Not enough rows") }
e <- val_psyo(psyo); if (e != "") {stop(e)}
