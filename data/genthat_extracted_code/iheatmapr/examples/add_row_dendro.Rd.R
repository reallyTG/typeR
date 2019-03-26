library(iheatmapr)


### Name: add_row_dendro
### Title: add_row_dendro
### Aliases: add_row_dendro add_row_dendro,Iheatmap,hclust-method

### ** Examples


mat <- matrix(rnorm(20), ncol = 5, nrow = 4)  
dend <- hclust(dist(mat))
hm <- iheatmap(mat) %>% add_row_dendro(dend)

# Print heatmap if interactive session 
if (interactive()) hm 



