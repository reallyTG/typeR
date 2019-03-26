library(iheatmapr)


### Name: reorder_rows
### Title: reorder_rows
### Aliases: reorder_rows reorder_rows,IheatmapHorizontal,integer-method
###   reorder_rows,IheatmapVertical,integer-method
###   reorder_rows,IheatmapVertical,integer-method

### ** Examples


mat <- matrix(rnorm(20), ncol = 5, nrow = 4)  
dend <- hclust(dist(mat))
hm <- iheatmap(mat) %>% reorder_rows(dend$order)

# Print heatmap if interactive session 
if (interactive()) hm 



