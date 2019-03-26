library(iheatmapr)


### Name: add_row_summary
### Title: add_row_summary
### Aliases: add_row_summary add_row_summary,Iheatmap-method

### ** Examples


mat <- matrix(rnorm(20), ncol = 5, nrow = 4)  
hm1 <- iheatmap(mat) %>% add_row_summary()
hm2 <- iheatmap(mat) %>% add_row_summary(groups = c("A","A","B","B","B"))

# Print heatmap if interactive session 
if (interactive()) hm1
if (interactive()) hm2



