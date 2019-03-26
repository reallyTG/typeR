library(psyosphere)


### Name: select_gaps
### Title: Select all coordinates with a gap
### Aliases: select_gaps

### ** Examples

# Get data
data(psyo_rounds2)
tracks <- psyo_rounds2

# Calculations
tracks <- average_duplicates(tracks)
tracks <- t_time_difference(tracks)

tracks <- mark_time_gaps(tracks)
tracks <- select_gaps(tracks,"time_gap")



