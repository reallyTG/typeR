
# Print title
cat("\nTesting select_without_gaps()\n")

# Get data
data(psyo_rounds2)
tracks_no_gaps <- psyo_rounds2

# Calculations
tracks_no_gaps <- psyosphere::average_duplicates(tracks_no_gaps)
tracks_no_gaps <- t_time_difference(tracks_no_gaps)

tracks_no_gaps <- mark_time_gaps(tracks_no_gaps)
tracks_no_gaps <- select_without_gaps(tracks_no_gaps,"time_gap")

# Check results
if (NROW(tracks_no_gaps) != 627) { stop("Wrong number of observations") }
if (NCOL(tracks_no_gaps) != 12) { stop("Wrong number of variables") }
