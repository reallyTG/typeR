
# Print title
cat("\nTesting select_gaps()\n")

# Remove one gap column --------------------------------------------------------

# Get data
data(psyo_rounds2)
tracks1 <- psyo_rounds2

# Calculations
tracks1 <- psyosphere::average_duplicates(tracks1)
tracks1 <- t_time_difference(tracks1)

tracks1 <- mark_time_gaps(tracks1)
tracks1 <- select_gaps(tracks1,"time_gap")

# Check results
if (NROW(tracks1) != 7) { stop("Wrong number of observations 1") }
if (NCOL(tracks1) != 12) { stop("Wrong number of variables1 1") }

# Remove two gap columns -------------------------------------------------------

# Get data
data(psyo_rounds2)
tracks2 <- psyo_rounds2

# Calculations
tracks2 <- psyosphere::average_duplicates(tracks2)
tracks2 <- t_time_difference(tracks2)
tracks2 <- t_speed(tracks2)
tracks2 <- mark_speed_gaps(tracks2,20)
tracks2 <- mark_time_gaps(tracks2)

tracks2 <- select_gaps(tracks2,c("time_gap","speed_gap"))

# Check results
if (NROW(tracks2) != 16) { stop("Wrong number of observations 2") }
if (NCOL(tracks2) != 14) { stop("Wrong number of variables 2") }
