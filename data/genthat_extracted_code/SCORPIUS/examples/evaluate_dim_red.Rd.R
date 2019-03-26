library(SCORPIUS)


### Name: evaluate_dim_red
### Title: Evaluate the dimensionality reduction
### Aliases: evaluate_dim_red

### ** Examples

## Generate a dataset
dataset <- generate_dataset(type="s", num_genes=500, num_samples=300, num_groups=4)
space <- reduce_dimensionality(dataset$expression, correlation_distance, ndim=2)

## Evaluate the trajectory timeline
evaluate_dim_red(space, dataset$sample_info$group_name)



