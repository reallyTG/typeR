library(SCORPIUS)


### Name: generate_dataset
### Title: Generate a synthetic dataset
### Aliases: generate_dataset

### ** Examples

## Generate a dataset
dataset <- generate_dataset(type = "poly", num_genes = 500, num_samples = 1000, num_groups = 4)

## Reduce dimensionality and infer trajectory with SCORPIUS
space <- reduce_dimensionality(dataset$expression, correlation_distance, ndim = 2)
traj <- infer_trajectory(space)

## Visualise
draw_trajectory_plot(space, path=traj$path, progression_group=dataset$sample_info$group_name)



