library(psyosphere)


### Name: mark_time_gaps
### Title: Mark segments between data gaps
### Aliases: mark_time_gaps

### ** Examples

# Get example data
data(psyo_rounds2)

# clean-up data
psyo_rounds2 <- average_duplicates(psyo_rounds2)

# Add gap segments
psyo_rounds2 <- t_time_difference(psyo_rounds2)
psyo_rounds2 <- mark_time_gaps(psyo_rounds2)

# Check result
psyo_rounds2 <- psyo_rounds2[ which(psyo_rounds2[,"time_gap"]) ,]



