library(iheatmapr)


### Name: setup_tooltip_options
### Title: Tooltip Options
### Aliases: setup_tooltip_options

### ** Examples


mat <- matrix(rnorm(20), ncol = 5, nrow = 4)  
hm1 <- main_heatmap(mat, 
   tooltip = setup_tooltip_options(row = FALSE, col = FALSE,
                                   prepend_value = "Value is ")) 

# Print heatmap if interactive session 
if (interactive()) hm1 



