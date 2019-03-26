
# Print title
cat("\nTesting des_first()\n")

# Calculations
data(psyo_rounds2)
first <- psyosphere::des_first(psyo_rounds2, "p_id")

# Check results
if (NROW(first) != 9) { stop("Wrong number of observations") }
if (NCOL(first) != 2) { stop("Wrong number of variables") }
test_sum <- sum(first$first, na.rm = TRUE)
if (round(test_sum,3) != round(15599,3)) {stop("Wrong test sum")}
