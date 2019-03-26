library(psyosphere)


### Name: mark_speed_gaps
### Title: Mark speeds that exceed a certain speed limit as gaps
### Aliases: mark_speed_gaps

### ** Examples

# Get example data
data(psyo_rounds2)
speedt <- psyo_rounds2[ c(1:5,11:15) ,]
remove(psyo_rounds2)

# clean-up data
speedt <- average_duplicates(speedt)
speedt <- t_time_difference(speedt)
speedt <- mark_time_gaps(speedt)

# Add speed
speedt <- t_speed(speedt)

# Advanced mean speed without speed gap
des_mean(speedt, "speed", "time_difference", "time_gap")

# Mark speed gap
speedt <- mark_speed_gaps(speedt, 8)

# Advanced mean speed with speed gap
des_mean(speedt, "speed", "time_difference", c("time_gap","speed_gap"))



