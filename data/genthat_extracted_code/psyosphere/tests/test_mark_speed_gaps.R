
# Print title
cat("\nTesting mark_speed_gaps()\n")

# Get example data
data(psyo_rounds2)
speedt <- psyo_rounds2[ c(1:5,11:15) ,]

# clean-up data
speedt <- psyosphere::average_duplicates(speedt)
speedt <- psyosphere::t_time_difference(speedt)
speedt <- psyosphere::mark_time_gaps(speedt)

# Add speed
speedt <- psyosphere::t_speed(speedt)

# Mark speed gap
speedt <- psyosphere::mark_speed_gaps(speedt, 8)

# Advanced mean speed with speed gap
speed_mean <- psyosphere::des_mean(
  speedt, "speed", "time_difference", c("time_gap","speed_gap")
)

# Check results
if (NROW(speedt) != 9) { stop("Wrong number of observations") }
if (NCOL(speedt) != 14) { stop("Wrong number of variables") }
if ( round(4.751414,5) != round(speed_mean,5) ) {
  stop("Wrong calculation result")
}
