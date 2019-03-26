library(iheatmapr)


### Name: add_col_labels
### Title: add_col_labels
### Aliases: add_col_labels add_col_labels,Iheatmap-method

### ** Examples


mat <- matrix(rnorm(20), ncol = 5, nrow = 4)  
hm1 <- iheatmap(mat) %>% add_col_labels()
hm2 <- iheatmap(mat) %>% add_col_labels(ticktext = letters[22:26])

# Print heatmap if interactive session 
if (interactive()) hm1
if (interactive()) hm2



