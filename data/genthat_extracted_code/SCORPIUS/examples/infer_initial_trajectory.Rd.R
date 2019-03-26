library(SCORPIUS)


### Name: infer_initial_trajectory
### Title: Infer an initial trajectory through space
### Aliases: infer_initial_trajectory

### ** Examples

## Generate an example dataset and visualise it
dataset <- generate_dataset(type = "poly", num_genes = 500, num_samples = 1000, num_groups = 4)
space <- reduce_dimensionality(dataset$expression, correlation_distance, ndim=2)
draw_trajectory_plot(space, progression_group = dataset$sample_info$group_name)

## Infer a trajectory through this space
init_traj <- infer_initial_trajectory(space, k = 4)

## Visualise the trajectory
draw_trajectory_plot(space, path = init_traj, progression_group = dataset$sample_info$group_name)



