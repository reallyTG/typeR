## ---- echo=F-------------------------------------------------------------
set.seed(4)

## ----message=FALSE-------------------------------------------------------
library(SCORPIUS)
dataset <- generate_dataset(type = "poly", num_genes = 500, num_samples = 384, num_groups = 4)

## ------------------------------------------------------------------------
dataset$expression[1:6, 1:6]

## ------------------------------------------------------------------------
head(dataset$sample_info)

## ------------------------------------------------------------------------
expression <- dataset$expression
group_name <- dataset$sample_info$group_name
space <- reduce_dimensionality(expression, correlation_distance, ndim = 3)

## ------------------------------------------------------------------------
draw_trajectory_plot(space)

## ------------------------------------------------------------------------
draw_trajectory_plot(space, progression_group = group_name)

## ------------------------------------------------------------------------
traj <- infer_trajectory(space)

## ------------------------------------------------------------------------
draw_trajectory_plot(space, progression_group = group_name, path = traj$path)

## ----find tafs-----------------------------------------------------------
gimp <- gene_importances(expression, traj$time, num_permutations = 0, num_threads = 8)
gene_sel <- gimp[1:50,]
expr_sel <- expression[,gene_sel$gene]

## ----visualise tafs------------------------------------------------------
draw_trajectory_heatmap(expr_sel, traj$time, group_name)

## ----moduled tafs--------------------------------------------------------
modules <- extract_modules(scale_quantile(expr_sel), traj$time, verbose = FALSE)
draw_trajectory_heatmap(expr_sel, traj$time, group_name, modules)

