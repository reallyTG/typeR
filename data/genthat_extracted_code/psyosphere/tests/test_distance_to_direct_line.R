
# Print title
cat("\nTesting distance_to_direct_line()\n")

# Get data
data(psyo_rounds2)

# Create finish line
finish <- data.frame(lon = c(6.851810,6.851000), lat = c(52.241800,52.240300))

# Get deviation from shortest rout from begin to finish
psyo_rounds2 <- psyosphere::select_test_sample(psyo_rounds2, 10)
psyo_rounds2 <- psyosphere::distance_to_direct_line(psyo_rounds2, finish)

# Check results
if (NCOL(psyo_rounds2) != 11) { stop("Not enough columns") }
if (NROW(psyo_rounds2) != 90) { stop("Not rows") }
e <- val_psyo(psyo_rounds2); if (e != "") {stop(e)}
