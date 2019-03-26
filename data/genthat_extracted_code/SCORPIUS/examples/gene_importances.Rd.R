library(SCORPIUS)


### Name: gene_importances
### Title: Calculate the importance of a feature
### Aliases: gene_importances

### ** Examples

dataset <- generate_dataset(type="s", num_genes=500, num_samples=300, num_groups=4)
expression <- dataset$expression
group_name <- dataset$sample_info$group_name
space <- reduce_dimensionality(expression, correlation_distance, ndim=2)
traj <- infer_trajectory(space)
# set ntree to at least 1000!
gene_importances(expression, traj$time, num_permutations = 0, ntree = 1000)



