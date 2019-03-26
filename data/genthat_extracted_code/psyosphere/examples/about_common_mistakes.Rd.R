library(psyosphere)


### Name: about common mistakes
### Title: Tips to prevent common mistakes
### Aliases: about_common_mistakes

### ** Examples

# Example forgetting to use weighted statistics --------------------------------
data(psyo)
tracks <- t_speed(psyo)
tracks <- t_time_difference(tracks, units = "secs")

# Without weighted statistics
mean(tracks[,c("speed")], na.rm = TRUE)
sd(tracks[,c("speed")], na.rm = TRUE)

# With weighted statistics
des_mean(tracks, "speed", "time_difference", t_id = "")

SDMTools::wt.mean(
  tracks[,c("speed")], as.numeric(tracks[,c("time_difference")])
)
SDMTools::wt.sd(
  tracks[,c("speed")], as.numeric(tracks[,c("time_difference")])
)



