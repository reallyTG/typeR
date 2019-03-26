library(iheatmapr)


### Name: add_col_clusters
### Title: add_col_clusters
### Aliases: add_col_clusters add_col_clusters,Iheatmap-method

### ** Examples


mat <- matrix(rnorm(20), ncol = 5, nrow = 4)
clusters <- c("A","B","A","B","A")

hm <- iheatmap(mat) %>% add_col_clusters(clusters)

# Print heatmap if interactive session 
if (interactive()) hm 



