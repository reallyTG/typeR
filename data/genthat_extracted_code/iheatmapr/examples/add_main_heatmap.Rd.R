library(iheatmapr)


### Name: add_main_heatmap
### Title: add_main_heatmap
### Aliases: add_main_heatmap
###   add_main_heatmap,IheatmapHorizontal,matrix-method
###   add_main_heatmap,IheatmapVertical,matrix-method
###   add_main_heatmap,IheatmapVertical,matrix-method

### ** Examples


mat <- matrix(rnorm(20), ncol = 5, nrow = 4) 
mat2 <-  matrix(rnorm(24), ncol = 6, nrow = 4) 
hm <- iheatmap(mat) %>% add_main_heatmap(mat2)

# Print heatmap if interactive session 
if (interactive()) hm 



