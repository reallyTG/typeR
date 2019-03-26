
# Print title
cat("\nTesting des_sum()\n")

# Get data
data(psyo_rounds2)
tracks <- psyo_rounds2

# Calculations
tracks <- t_distance(tracks)
summary <- des_sum(tracks, "distances_in_m")

# Check results
if (NROW(summary) != 9) { stop("Wrong number of observations") }
if (NCOL(summary) != 2) { stop("Wrong number of variables") }
test_sum <- sum(summary$sum)
if ( round(test_sum,3) != round(1375.08331638578,3) ) {stop("Wrong test sum")}
