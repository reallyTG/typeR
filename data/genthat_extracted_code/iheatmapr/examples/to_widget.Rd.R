library(iheatmapr)


### Name: to_widget
### Title: to_widget
### Aliases: to_widget to_widget,Iheatmap-method

### ** Examples


mat <- matrix(rnorm(24), nrow = 6)
hm <- iheatmap(mat) %>% to_widget()
class(hm)

# Print heatmap if interactive session 
if (interactive()) hm 



