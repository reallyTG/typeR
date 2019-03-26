library(iheatmapr)


### Name: add_row_clustering
### Title: add_row_clustering
### Aliases: add_row_clustering add_row_clustering,Iheatmap-method

### ** Examples


mat <- matrix(rnorm(20), ncol = 5, nrow = 4)
hm <- iheatmap(mat) %>% add_row_clustering(method = "hclust", k = 2)

# Print heatmap if interactive session 
if (interactive()) hm 



