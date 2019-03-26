
# Print title
cat("\nTesting t_bearing()\n")

# Test simple bearings ---------------------------------------------------------
data(psyo)
psyo <- psyosphere::t_bearing(psyo)
bearing_sum <- sum(psyo[,c("bearings")], na.rm = TRUE)

# Check results
if (NCOL(psyo) != 6) { stop("Not enough columns") }
if (NROW(psyo) != 15) { stop("Not rows") }
e <- val_psyo(psyo); if (e != "") {stop(e)}
if (round(bearing_sum,5) != round(-438.490786935083,5)) {
  stop("Bearing sum is wrong.")
}

















