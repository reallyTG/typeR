library(SCORPIUS)


### Name: reverse_trajectory
### Title: Reverse a trajectory
### Aliases: reverse_trajectory

### ** Examples

## Generate an example dataset and infer a trajectory through it
dataset <- generate_dataset(type="poly", num_genes=500, num_samples=1000, num_groups=4)
group_name <- dataset$sample_info$group_name
space <- reduce_dimensionality(dataset$expression, correlation_distance, ndim=2)
traj <- infer_trajectory(space)

## Visualise the trajectory
draw_trajectory_plot(space, group_name, path=traj$path)

## Reverse the trajectory
reverse_traj <- reverse_trajectory(traj)
draw_trajectory_plot(space, group_name, path=reverse_traj$path)

## It's the same but reversed?!
plot(traj$time, reverse_traj$time, type="l")



