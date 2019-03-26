library(iheatmapr)


### Name: add_col_signal
### Title: add_col_signal
### Aliases: add_col_signal add_col_signal,Iheatmap-method

### ** Examples


mat <- matrix(rnorm(20), ncol = 5, nrow = 4)  
hm <- iheatmap(mat) %>% add_col_signal(signal = 1:5, name = "Strength")

# Print heatmap if interactive session 
if (interactive()) hm 



