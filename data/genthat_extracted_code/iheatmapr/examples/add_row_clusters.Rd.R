library(iheatmapr)


### Name: add_row_clusters
### Title: add_row_clusters
### Aliases: add_row_clusters add_row_clusters,Iheatmap-method

### ** Examples


mat <- matrix(rnorm(20), ncol = 5, nrow = 4)
clusters <- c("A","B","A","B")

hm <- iheatmap(mat) %>% add_row_clusters(clusters)

# Print heatmap if interactive session 
if (interactive()) hm



