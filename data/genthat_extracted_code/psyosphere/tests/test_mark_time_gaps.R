
# Print title
cat("\nTesting mark_time_gaps()\n")

# Get example data
data(psyo_rounds2)
gap <- psyo_rounds2

# clean-up data
gap <- psyosphere::average_duplicates(gap)

# Add gap segments
gap <- psyosphere::t_time_difference(gap)
gap <- psyosphere::mark_time_gaps(gap)

# Check results
test_gap <- unique(gap[ which(gap$time_gap) ,])

if (NROW(test_gap) != 7) { stop("Wrong number of observations") }
if (NCOL(test_gap) != 12) { stop("Wrong number of variables") }

e <- val_psyo(gap); if (e != "") {stop(e)}
