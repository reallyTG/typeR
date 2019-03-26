library(iheatmapr)


### Name: add_row_signal
### Title: add_row_signal
### Aliases: add_row_signal add_row_signal,Iheatmap-method

### ** Examples


mat <- matrix(rnorm(20), ncol = 5, nrow = 4)  
hm <- iheatmap(mat) %>% add_row_signal(signal = 1:4, name = "Strength")

# Print heatmap if interactive session 
if (interactive()) hm 



