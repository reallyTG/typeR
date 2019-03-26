library(iheatmapr)


### Name: add_row_plot
### Title: add_row_plot
### Aliases: add_row_plot add_row_plot,Iheatmap-method

### ** Examples


mat <- matrix(rnorm(20), ncol = 5, nrow = 4)  
hm <- iheatmap(mat) %>% add_row_plot(x = 1:4, tracename = "Strength")

# Print heatmap if interactive session 
if (interactive()) hm 



