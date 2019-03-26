library(mousetrap)


### Name: mt_aggregate
### Title: Aggregate mouse-tracking data per condition.
### Aliases: mt_aggregate

### ** Examples

# Time-normalize trajectories
mt_example <- mt_time_normalize(mt_example)

# Aggregate time-normalized trajectories per condition
average_trajectories <-  mt_aggregate(mt_example,
  use="tn_trajectories",
  use2_variables="Condition"
)


# Calculate mouse-tracking measures
mt_example <- mt_measures(mt_example)

# Aggregate measures per condition
average_measures <- mt_aggregate(mt_example,
  use="measures", use_variables=c("MAD", "AD"),
  use2_variables="Condition"
)

# Aggregate measures per condition
# first within subjects and then across subjects
average_measures <- mt_aggregate(mt_example,
  use="measures", use_variables=c("MAD", "AD"),
  use2_variables="Condition",
  subject_id="subject_nr"
)




