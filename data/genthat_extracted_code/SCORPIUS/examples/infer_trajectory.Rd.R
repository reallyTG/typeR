library(SCORPIUS)


### Name: infer_trajectory
### Title: Infer linear trajectory through space
### Aliases: infer_trajectory

### ** Examples

## Generate an example dataset and visualise it
dataset <- generate_dataset(type = "poly", num_genes = 500, num_samples = 1000, num_groups = 4)
space <- reduce_dimensionality(dataset$expression, correlation_distance, ndim=2)
draw_trajectory_plot(space, progression_group = dataset$sample_info$group_name)

## Infer a trajectory through this space
traj <- infer_trajectory(space)

## Visualise the trajectory
draw_trajectory_plot(space, path=traj$path, progression_group=dataset$sample_info$group_name)



