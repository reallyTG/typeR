
# Print title
cat("\nTesting des_duplicates()\n")

# Get data
data(psyo_rounds2)
tracks <- psyo_rounds2

# Calculations
descriptive <- des_duplicates(tracks, "time")

# Check results
if (NROW(descriptive) != 9) { stop("Wrong number of observations") }
if (NCOL(descriptive) != 2) { stop("Wrong number of variables") }
test_sum <- sum(descriptive$duplicates)
if (test_sum != 81) {stop("Wrong test_sum")}
