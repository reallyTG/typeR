
cat("\nTesting des_mean()\n")

# Get example data
data(psyo_rounds2)
mtracks <- psyo_rounds2[ c(1:5,11:15) ,]

# clean-up data
mtracks <- psyosphere::average_duplicates(mtracks)

# Add gap segments
mtracks <- psyosphere::t_time_difference(mtracks)
mtracks <- psyosphere::mark_time_gaps(mtracks)

# Add speed
mtracks <- psyosphere::t_speed(mtracks)

# Calculate means
normal1 <- mean(mtracks$speed, na.rm = TRUE)

weighted1 <- stats::weighted.mean(
  mtracks$speed, mtracks$time_difference, na.rm = TRUE
)

segmented1 <- mean(mtracks[c(1:5,7:9),c("speed")], na.rm = TRUE)

segmented_weighted1 <- stats::weighted.mean(mtracks[c(1:5,7:9),c("speed")],
  mtracks[c(1:5,7:9),c("time_difference")], na.rm = TRUE
)

# Caculate mean with des_mean
normal2 <- psyosphere::des_mean(mtracks, "speed")

weighted2 <- psyosphere::des_mean(mtracks, "speed", cweight = "time_difference")

segmented2 <- psyosphere::des_mean(mtracks, "speed", cgaps = "time_gap")

segmented_weighted2 <- psyosphere::des_mean(
  mtracks, "speed", cweight = "time_difference",cgaps = "time_gap"
)

# Check results

if (round(normal1,5) != round(normal2,5)) {
  stop("Normal mean is wrong.")
}

if (round(segmented1,5) != round(segmented2,5)) {
  stop("Segmented mean is wrong.")
}

if (round(weighted1,5) != round(weighted2,5)) {
  stop("Weighted mean is wrong.")
}

if (round(segmented_weighted1,5) != round(segmented_weighted2,5)) {
  stop("Segmented weighted mean is wrong.")
}

cat("\n")
