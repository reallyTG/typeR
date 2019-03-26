library(mousetrap)


### Name: mt_aggregate_per_subject
### Title: Aggregate mouse-tracking data per condition separately for each
###   subject.
### Aliases: mt_aggregate_per_subject

### ** Examples

# Time-normalize trajectories
mt_example <- mt_time_normalize(mt_example)

# Aggregate time-normalized trajectories per condition
# separately per subject
average_trajectories <- mt_aggregate_per_subject(
  mt_example,
  use="tn_trajectories",
  use2_variables="Condition",
  subject_id="subject_nr"
)


# Calculate mouse-tracking measures
mt_example <- mt_measures(mt_example)

# Aggregate measures per condition
# separately per subject
average_measures <- mt_aggregate_per_subject(
  mt_example,
  use="measures",
  use_variables=c("MAD", "AD"),
  use2_variables="Condition",
  subject_id="subject_nr"
)




