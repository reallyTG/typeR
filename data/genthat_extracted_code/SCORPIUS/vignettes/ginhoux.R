## ---- echo=FALSE---------------------------------------------------------
set.seed(4)

## ----message=FALSE-------------------------------------------------------
library(SCORPIUS)
data(ginhoux)

## ------------------------------------------------------------------------
ginhoux$expression[1:6, 1:6]

## ------------------------------------------------------------------------
head(ginhoux$sample_info)

## ------------------------------------------------------------------------
expression <- ginhoux$expression
group_name <- ginhoux$sample_info$group_name
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

## ----recalculate time----------------------------------------------------
traj <- infer_trajectory(expr_sel)

## ----visualise tafs------------------------------------------------------
draw_trajectory_heatmap(expr_sel, traj$time, group_name)

## ----moduled tafs--------------------------------------------------------
modules <- extract_modules(scale_quantile(expr_sel), traj$time, verbose = F)
draw_trajectory_heatmap(expr_sel, traj$time, group_name, modules)

