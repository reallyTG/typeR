library(mousetrap)


### Name: mt_average
### Title: Average trajectories across intervals.
### Aliases: mt_average

### ** Examples

mt_example <- mt_derivatives(mt_example)

# average trajectories across 100 ms intervals
mt_example <- mt_average(mt_example, save_as="av_trajectories",
  interval_size=100)

# average time-normalized trajectories across specific intervals
# of the time steps
mt_example <- mt_time_normalize(mt_example)
mt_example <- mt_average(mt_example,
  use="tn_trajectories", save_as="av_tn_trajectories",
  av_dimension = "steps", intervals = c(0.5,33.5,67.5,101.5))




