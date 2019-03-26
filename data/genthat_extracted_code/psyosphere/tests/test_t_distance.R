
# Print title
cat("\nTesting t_distance()\n")

# Calculations
data(psyo)
psyo <- psyosphere::t_distance(psyo)

# Check results
if (NCOL(psyo) != 6) { stop("Not enough columns") }
if (NROW(psyo) != 15) { stop("Not rows") }
e <- val_psyo(psyo); if (e != "") {stop(e)}
