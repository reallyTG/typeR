library(iheatmapr)


### Name: add_col_title
### Title: add_col_title
### Aliases: add_col_title add_col_title,Iheatmap-method

### ** Examples


mat <- matrix(rnorm(20), ncol = 5, nrow = 4)  
hm <- iheatmap(mat) %>% add_col_title("My x-axis")

# Print heatmap if interactive session 
if (interactive()) hm 



