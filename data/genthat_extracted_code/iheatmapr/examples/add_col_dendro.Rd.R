library(iheatmapr)


### Name: add_col_dendro
### Title: add_col_dendro
### Aliases: add_col_dendro add_col_dendro,Iheatmap,hclust-method

### ** Examples


mat <- matrix(rnorm(20), ncol = 5, nrow = 4)  
dend <- hclust(dist(t(mat)))
hm <- iheatmap(mat) %>% add_col_dendro(dend)

# Print heatmap if interactive session 
if (interactive()) hm 



