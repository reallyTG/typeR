library(mousetrap)


### Name: mt_deviations
### Title: Calculate deviations from idealized trajectory.
### Aliases: mt_deviations

### ** Examples

# Calculate deviations from idealized trajectory
# (straight line connecting the start and end point of each trial)
mt_example <- mt_deviations(mt_example)
  
# Calculate deviations from idealized trajectory with
# constant start and end points across trials
mt_example <- mt_deviations(mt_example,
  start_ideal=c(0,0), end_ideal=c(-665,974))




