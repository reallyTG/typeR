library(SCORPIUS)


### Name: draw_trajectory_plot
### Title: Visualise SCORPIUS
### Aliases: draw_trajectory_plot

### ** Examples

## Generate a synthetic dataset
dataset <- generate_dataset(type="p", num_genes=500, num_samples=300, num_groups=4)
space <- reduce_dimensionality(dataset$expression, correlation_distance, ndim=2)
groups <- dataset$sample_info$group_name

## Simply plot the samples
draw_trajectory_plot(space)

## Colour each sample according to its group
draw_trajectory_plot(space, progression_group=groups)

## Add contours to the plot
draw_trajectory_plot(space, progression_group=groups, contour=TRUE)

## Plot contours without colours
draw_trajectory_plot(space, contour=TRUE)

## Infer a trajectory and plot it
traj <- infer_trajectory(space)
draw_trajectory_plot(space, progression_group=groups, path=traj$path)
draw_trajectory_plot(space, progression_group=groups, path=traj$path, contour=TRUE)



