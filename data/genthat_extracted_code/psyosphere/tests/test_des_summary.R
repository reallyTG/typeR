
# Print title
cat("\nTesting des_summary()\n")

# Get data
data(psyo_rounds2)
tracks <- psyo_rounds2

# Calculations
descriptive1 <- des_summary(tracks)

# Without weight
descriptive2 <- des_summary(tracks, cweight = "")

# With own weight
tracks <- t_time_difference(tracks, cname = "time_dif")
descriptive3 <- des_summary(tracks, cweight = "time_dif")

# Merge
descriptive4 <- des_sum(tracks, "p_id", cname = "p_id_sum")
descriptive5 <- des_summary(tracks, des_df = descriptive4)

# Check results
if (NROW(descriptive1) != 9) { stop("Wrong number of observations") }
if (NCOL(descriptive1) != 17) { stop("Wrong number of variables") }
test_sum <- sum(descriptive5$p_id_sum)
if (round(test_sum,3) != round(1260115,3)) {stop("Wrong test_sum")}
if (!all.equal(descriptive1,descriptive3)) {stop("Data frames don't match")}

# Test with time ---------------------------------------------------------------

# Get data
data(psyo_rounds2)
tracks <- psyo_rounds2

# Gaps
tracks <- average_duplicates(tracks)
tracks <- t_time_difference(tracks)
tracks <- t_speed(tracks)
tracks <- mark_time_gaps(tracks)
tracks <- mark_speed_gaps(tracks, 40)
descriptive6 <- des_summary(
  tracks, cweight = "time_difference", cgaps = c("time_gap", "speed_gap")
)
test_sum_gap <- sum(descriptive6[,"time_gap"]) + sum(descriptive6[,"speed_gap"])
if (round(test_sum_gap,3) != round(7,3)) {stop("Wrong gap test_sum")}
