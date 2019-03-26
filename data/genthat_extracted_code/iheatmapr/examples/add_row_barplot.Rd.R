library(iheatmapr)


### Name: add_row_barplot
### Title: add_row_barplot
### Aliases: add_row_barplot add_row_barplot,Iheatmap-method

### ** Examples


mat <- matrix(rnorm(20), ncol = 5, nrow = 4)  
hm <- iheatmap(mat) %>% add_row_barplot(x = 1:4, tracename = "Strength")

# Print heatmap if interactive session 
if (interactive()) hm 



