library(drake)


### Name: expand_plan
### Title: Create replicates of targets.
### Aliases: expand_plan

### ** Examples

# Create the part of the workflow plan for the datasets.
datasets <- drake_plan(
  small = simulate(5),
  large = simulate(50))
# Create replicates. If you want repeat targets,
# this is convenient.
expand_plan(datasets, values = c("rep1", "rep2", "rep3"))
# Choose whether to rename the targets based on the values.
expand_plan(datasets, values = 1:3, rename = TRUE)
expand_plan(datasets, values = 1:3, rename = FALSE)



