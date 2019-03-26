
cat("\nTesting des_sd()\n")

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

# Calculate sds
normal1 <- sd(mtracks$speed, na.rm = TRUE)

mtracks2 <- mtracks
mtracks2$time_difference <- as.numeric(mtracks2$time_difference)

weighted1 <- SDMTools::wt.sd(
  mtracks2$speed, mtracks2$time_difference
)

segmented1 <- sd(mtracks2[c(1:5,7:9),c("speed")], na.rm = TRUE)

segmented_weighted1 <- SDMTools::wt.sd(
  mtracks2[c(1:5,7:9),c("speed")],
  mtracks2[c(1:5,7:9),c("time_difference")]
)

# Caculate sd with des_sd
normal2 <- psyosphere::des_sd(mtracks, "speed")

weighted2 <- psyosphere::des_sd(mtracks, "speed", cweight = "time_difference")

segmented2 <- psyosphere::des_sd(mtracks, "speed", cgaps = "time_gap")

segmented_weighted2 <- psyosphere::des_sd(
  mtracks, "speed", cweight = "time_difference",cgaps = "time_gap"
)

# Check results

if (round(normal1,5) != round(normal2,5)) {
  stop("Normal sd is wrong.")
}

if (round(segmented1,5) != round(segmented2,5)) {
  stop("Segmented sd is wrong.")
}

if (round(weighted1,5) != round(weighted2,5)) {
  stop("Weighted sd is wrong.")
}

if (round(segmented_weighted1,5) != round(segmented_weighted2,5)) {
  stop("Segmented weighted sd is wrong.")
}

cat("\n")
