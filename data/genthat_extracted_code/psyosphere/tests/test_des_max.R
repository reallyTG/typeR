
# Print title
cat("\nTesting des_max()\n")

# Calculations
data(psyo_rounds2)
test_max <- psyosphere::des_max(psyo_rounds2,"time")

test_max$max <- as.POSIXct(test_max$max, tz = "GMT+1")

# Check results
if (NROW(test_max) != 9) { stop("Wrong number of observations") }
if (NCOL(test_max) != 2) { stop("Wrong number of variables") }
test_time <- as.POSIXct("2015-09-03 13:52:47", tz = "MET")
if (test_max[1,"max"] != test_time) {stop("Wrong time")}
