library(iheatmapr)


### Name: add_subplot
### Title: add_subplot
### Aliases: add_subplot add_subplot,Iheatmap-method

### ** Examples

mat <- matrix(rnorm(24), ncol = 6)
hm <- iheatmap(mat) %>% add_subplot(x = 1:5, y=1:5, side = "top")

# Print heatmap if interactive session 
if (interactive()) hm 



