library(mousetrap)


### Name: mt_reshape
### Title: General-purpose reshape and aggregation function for mousetrap
###   data.
### Aliases: mt_reshape

### ** Examples

# Time-normalize trajectories
mt_example <- mt_time_normalize(mt_example)

# Reshape time-normalized trajectories data into long format
# adding Condition variable
trajectories_long <- mt_reshape(mt_example,
 use="tn_trajectories",
 use2_variables="Condition"
 )

# Reshape time-normalized trajectories data into wide format
# only keeping xpos and ypos
# and adding Condition variable
trajectories_wide <- mt_reshape(mt_example,
  use="tn_trajectories", use_variables = c("xpos","ypos"),
  use2_variables = "Condition",
  trajectories_long = FALSE
  )




