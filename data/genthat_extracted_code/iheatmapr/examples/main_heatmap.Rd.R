library(iheatmapr)


### Name: main_heatmap
### Title: main_heatmap
### Aliases: main_heatmap main_heatmap,matrix-method

### ** Examples


mat <- matrix(rnorm(20), ncol = 5, nrow = 4)  
hm <- main_heatmap(mat) 

# Print heatmap if interactive session 
if (interactive()) hm 



