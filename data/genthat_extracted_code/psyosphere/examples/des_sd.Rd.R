library(psyosphere)


### Name: des_sd
### Title: Calculate normal and weighted sds while excluding gaps in data
### Aliases: des_sd

### ** Examples

# Get example data
data(psyo_rounds2)
psyo_rounds2 <- psyo_rounds2[ c(1:5,11:15) ,]

# clean-up data
psyo_rounds2 <- average_duplicates(psyo_rounds2)

# Add gap segments
psyo_rounds2 <- t_time_difference(psyo_rounds2)
psyo_rounds2 <- mark_time_gaps(psyo_rounds2)

# Add speed
psyo_rounds2 <- t_speed(psyo_rounds2)

# Calculate different sds
normal <- des_sd(psyo_rounds2, "speed", cname = "normal")

weighted <- des_sd(
  psyo_rounds2, "speed", cweight = "time_difference", cname = "weighted"
)

segmented <- des_sd(
  psyo_rounds2, "speed", cgaps= "time_gap", cname = "segmented"
)

segmented_weighted <- des_sd(
  psyo_rounds2,
  "speed",
  cweight = "time_difference",
  cgaps = "time_gap",
  cname = "segmented_weighted"
)



