library(SCORPIUS)


### Name: draw_trajectory_heatmap
### Title: Draw time-series heatmap
### Aliases: draw_trajectory_heatmap

### ** Examples

## Not run: 
##D ## Generate a dataset
##D dataset <- generate_dataset(type="s", num_genes=500, num_samples=300, num_groups=4)
##D expression <- dataset$expression
##D space <- reduce_dimensionality(expression, correlation_distance, ndim=2)
##D groups <- dataset$sample_info$group_name
##D traj <- infer_trajectory(space)
##D time <- traj$time
##D 
##D gimp <- gene_importances(expression, traj$time, num_permutations = 0, ntree = 10000)
##D gene_sel <- gimp[1:50,]
##D expr_sel <- expression[,gene_sel$gene]
##D 
##D ## Draw a time series heatmap
##D draw_trajectory_heatmap(expr_sel, time)
##D 
##D ## Also show the progression groupings
##D draw_trajectory_heatmap(expr_sel, time, progression=groups)
##D 
##D ## Group the genes into modules and visualise the modules in a heatmap
##D modules <- extract_modules(scale_quantile(expr_sel))
##D draw_trajectory_heatmap(expr_sel, time, progression_group=groups, modules=modules)
## End(Not run)



