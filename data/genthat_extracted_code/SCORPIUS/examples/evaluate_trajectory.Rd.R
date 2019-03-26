library(SCORPIUS)


### Name: evaluate_trajectory
### Title: Evaluate the inferred timeline
### Aliases: evaluate_trajectory

### ** Examples

## Generate a dataset
dataset <- generate_dataset(type="s", num_genes=500, num_samples=1000, num_groups=4)
space <- reduce_dimensionality(dataset$expression, correlation_distance, ndim=2)
traj <- infer_trajectory(space)

## Evaluate the trajectory timeline
evaluate_trajectory(traj$time, dataset$sample_info$group_name)



