library(iheatmapr)


### Name: add_col_plot
### Title: add_col_plot
### Aliases: add_col_plot add_col_plot,Iheatmap-method

### ** Examples


mat <- matrix(rnorm(20), ncol = 5, nrow = 4)  
hm <- iheatmap(mat) %>% add_col_plot(y = 1:5, tracename = "Strength")

# Print heatmap if interactive session 
if (interactive()) hm 



