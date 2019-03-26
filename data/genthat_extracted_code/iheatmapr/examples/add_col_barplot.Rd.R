library(iheatmapr)


### Name: add_col_barplot
### Title: add_col_barplot
### Aliases: add_col_barplot add_col_barplot,Iheatmap-method

### ** Examples


mat <- matrix(rnorm(20), ncol = 5, nrow = 4)  
hm <- iheatmap(mat) %>% add_col_barplot(y = 1:5, tracename = "Strength")

# Print heatmap if interactive session 
if (interactive()) hm 



