library(mousetrap)


### Name: mt_sample_entropy
### Title: Calculate sample entropy.
### Aliases: mt_sample_entropy

### ** Examples

# Calculate sample entropy based on time-normalized
# trajectories and merge results with other meausres
# derived from raw trajectories
mt_example <- mt_measures(mt_example)
mt_example <- mt_time_normalize(mt_example,
  save_as="tn_trajectories", nsteps=101)
mt_example <- mt_sample_entropy(mt_example,
  use="tn_trajectories", save_as="measures",
  dimension="xpos", m=3)




