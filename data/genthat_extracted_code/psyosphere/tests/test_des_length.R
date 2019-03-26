
# Print title
cat("\nTesting des_length()\n")

# Get data
data(psyo_rounds2)
tracks <- psyo_rounds2

# Calculations
descriptive <- des_length(tracks)

# Check results
if (NROW(descriptive) != 9) { stop("Wrong number of observations") }
if (NCOL(descriptive) != 2) { stop("Wrong number of variables") }
test_sum <- sum(descriptive$length)
if (round(test_sum,3) != round(715,3)) {stop("Wrong test_sum")}
