library(iheatmapr)


### Name: add_row_labels
### Title: add_row_labels
### Aliases: add_row_labels add_row_labels,Iheatmap-method

### ** Examples


mat <- matrix(rnorm(20), ncol = 5, nrow = 4)  
hm1 <- iheatmap(mat) %>% add_row_labels()
hm2 <- iheatmap(mat) %>% add_row_labels(ticktext = letters[23:26])


# Print heatmaps if interactive session 
if (interactive()) hm1
if (interactive()) hm2 



