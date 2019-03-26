library(iheatmapr)


### Name: modify_layout
### Title: modify_layout
### Aliases: modify_layout modify_layout,Iheatmap-method

### ** Examples


mat <- matrix(rnorm(20), ncol = 5, nrow = 4)  
hm <- main_heatmap(mat) %>% modify_layout(list(margin = list(b = 120))) 

# Print heatmap if interactive session 
if (interactive()) hm 



