library(iheatmapr)


### Name: add_col_clustering
### Title: add_col_clustering
### Aliases: add_col_clustering add_col_clustering,Iheatmap-method

### ** Examples


mat <- matrix(rnorm(20), ncol = 5, nrow = 4)
hm <- iheatmap(mat) %>% add_col_clustering(method = "hclust", k = 2)

# Print heatmap if interactive session 
if (interactive()) hm 



