library(psyosphere)


### Name: des_sum
### Title: Calculates sum for each track
### Aliases: des_sum

### ** Examples

# Get data
data(psyo_rounds2)
tracks <- psyo_rounds2

# Calculations
tracks <- t_distance(tracks)
summary <- des_sum(tracks, "distances_in_m")



