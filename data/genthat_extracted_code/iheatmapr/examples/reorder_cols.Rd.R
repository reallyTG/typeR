library(iheatmapr)


### Name: reorder_cols
### Title: reorder_cols
### Aliases: reorder_cols reorder_cols,IheatmapHorizontal,integer-method
###   reorder_cols,IheatmapVertical,integer-method
###   reorder_cols,IheatmapVertical,integer-method

### ** Examples


mat <- matrix(rnorm(20), ncol = 5, nrow = 4)  
dend <- hclust(dist(t(mat)))
hm <- iheatmap(mat) %>% reorder_cols(dend$order)

# Print heatmap if interactive session 
if (interactive()) hm 



