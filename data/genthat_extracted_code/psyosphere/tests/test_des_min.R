
# Print title
cat("\nTesting des_min()\n")

# Calculations
data(psyo_rounds2)
test_min <- psyosphere::des_min(psyo_rounds2,"time")

# Check results
if (NROW(test_min) != 9) { stop("Wrong number of observations") }
if (NCOL(test_min) != 2) { stop("Wrong number of variables") }
test_time <- as.POSIXct("2015-09-03 13:50:57", tz = "MET")
if (test_min[1,"min"] != test_time) {stop("Wrong time")}
