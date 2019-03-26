library(SCORPIUS)


### Name: reduce_dimensionality
### Title: Dimensionality reduction
### Aliases: reduce_dimensionality

### ** Examples

## Generate an example dataset
dataset <- generate_dataset(type = "poly", num_genes = 500, num_samples = 1000, num_groups = 4)

## Reduce the dimensionality of this dataset
space <- reduce_dimensionality(dataset$expression, correlation_distance, ndim = 2)

## Visualise the dataset
draw_trajectory_plot(space, progression_group=dataset$sample_info$group_name)



