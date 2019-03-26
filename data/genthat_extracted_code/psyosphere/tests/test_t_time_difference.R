
# Print title
cat("\nTesting t_time_difference()\n")

# Test time difference in seconds ----------------------------------------------

# Get data
data(psyo)
seconds <- psyosphere::t_time_difference(psyo)

# Check results
if (NCOL(seconds) != 6) { stop("Not enough columns") }
if (NROW(seconds) != 15) { stop("Not rows") }
e <- val_psyo(seconds); if (e != "") {stop(e)}
seconds_sum <- sum(seconds[,c("time_difference")], na.rm = TRUE)
if (seconds_sum != 323) {
  stop("Time difference is not as expected.")
}
