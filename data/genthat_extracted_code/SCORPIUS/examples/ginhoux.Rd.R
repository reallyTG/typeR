library(SCORPIUS)


### Name: ginhoux
### Title: scRNA-seq data of dendritic cell progenitors.
### Aliases: ginhoux
### Keywords: datasets

### ** Examples

## Load dataset from Schlitzer et al., 2015
data("ginhoux")

## Reduce dimensionality and infer trajectory with SCORPIUS
space <- reduce_dimensionality(ginhoux$expression, correlation_distance)
traj <- infer_trajectory(space)

## Visualise
draw_trajectory_plot(
  space,
  path = traj$path,
  progression_group = ginhoux$sample_info$group_name)



