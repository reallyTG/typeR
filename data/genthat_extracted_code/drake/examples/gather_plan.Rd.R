library(drake)


### Name: gather_plan
### Title: Write commands to combine several targets into one or more
###   overarching targets.
### Aliases: gather_plan

### ** Examples

# Workflow plan for datasets:
datasets <- drake_plan(
  small = simulate(5),
  large = simulate(50)
)
# Create a new target that brings the datasets together.
gather_plan(datasets, target = "my_datasets", append = FALSE)
# This time, the new target just appends the rows of 'small' and 'large'
# into a single matrix or data frame.
gathered <- gather_plan(
  datasets,
  target = "aggregated_data",
  gather = "rbind",
  append = FALSE
)
gathered
# For the complete workflow plan, row bind the pieces together.
bind_plans(datasets, gathered)
# Alternatively, you can set `append = TRUE` to incorporate
# the new targets automatically.
gather_plan(
  datasets,
  target = "aggregated_data",
  gather = "rbind",
  append = TRUE
)



