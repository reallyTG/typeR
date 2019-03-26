library(iheatmapr)


### Name: add_iheatmap
### Title: add_iheatmap
### Aliases: add_iheatmap add_iheatmap,IheatmapHorizontal,matrix-method
###   add_iheatmap,IheatmapVertical,matrix-method
###   add_iheatmap,IheatmapVertical,matrix-method

### ** Examples


mat <- matrix(rnorm(24), nrow = 6)
mat2 <- matrix(rnorm(24), nrow = 6)
annotation = data.frame(gender = c(rep("M", 3),rep("F",3)),
                        age = c(20,34,27,19,23,30))
hm <- iheatmap(mat, 
 cluster_rows = "hclust", 
 cluster_cols = "hclust", 
 col_k = 3) %>%
add_iheatmap(mat2, 
 cluster_cols = "hclust", 
 col_k = 3, 
 row_annotation = annotation)

# Print heatmap if interactive session 
if (interactive()) hm 



