library(iheatmapr)


### Name: add_col_summary
### Title: add_col_summary
### Aliases: add_col_summary add_col_summary,Iheatmap-method

### ** Examples


mat <- matrix(rnorm(20), ncol = 5, nrow = 4)  
hm1 <- iheatmap(mat) %>% add_col_summary()
hm2 <- iheatmap(mat) %>% add_col_summary(groups = c("A","A","B","B"))

# Print heatmap if interactive session 
if (interactive()) hm1
if (interactive()) hm2



