library(iheatmapr)


### Name: setup_colorbar_grid
### Title: setup_colorbar_grid
### Aliases: setup_colorbar_grid

### ** Examples


cb_grid <- setup_colorbar_grid(nrows = 2, x_spacing = 0.2)
mat <- matrix(rnorm(24), nrow = 6)
hm <- iheatmap(mat, colorbar_grid = cb_grid, cluster_rows = "kmeans",
         cluster_cols = "kmeans", row_k = 3, col_k = 2)

# Print heatmap if interactive session 
if (interactive()) hm 



