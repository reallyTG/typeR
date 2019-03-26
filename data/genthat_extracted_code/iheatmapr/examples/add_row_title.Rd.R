library(iheatmapr)


### Name: add_row_title
### Title: add_row_title
### Aliases: add_row_title add_row_title,Iheatmap-method

### ** Examples


mat <- matrix(rnorm(20), ncol = 5, nrow = 4)  
hm <- iheatmap(mat) %>% add_row_title("Samples")

# Print heatmap if interactive session 
if (interactive()) hm 



