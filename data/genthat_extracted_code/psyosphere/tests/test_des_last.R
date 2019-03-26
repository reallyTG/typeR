
# Print title
cat("\nTesting des_last()\n")

# Calculations
data(psyo_rounds2)
last <- psyosphere::des_last(psyo_rounds2, "p_id")

# Check results
if (NROW(last) != 9) { stop("Wrong number of observations") }
if (NCOL(last) != 2) { stop("Wrong number of variables") }
test_sum <- sum(last$last, na.rm = TRUE)
if (round(test_sum,3) != round(16305,3)) {stop("Wrong test sum")}
