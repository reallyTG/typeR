library(iheatmapr)


### Name: iheatmap
### Title: iheatmap
### Aliases: iheatmap iheatmap,matrix-method

### ** Examples

mat <- matrix(rnorm(24), nrow = 6)
annotation = data.frame(gender = c(rep("M", 3),rep("F",3)),
 age = c(20,34,27,19,23,30))
hm <- iheatmap(mat, 
 cluster_rows = "hclust",
 cluster_cols = "kmeans", 
 col_k = 3, 
 row_annotation = annotation)

# Print heatmap if interactive session 
if (interactive()) hm 



