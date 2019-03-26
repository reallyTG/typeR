library(iheatmapr)


### Name: add_col_groups
### Title: add_col_groups
### Aliases: add_col_groups add_col_groups,Iheatmap-method

### ** Examples


mat <- matrix(rnorm(20), ncol = 5, nrow = 4)
col_groups <- c("A","A","B","D","B")
hm <- iheatmap(mat) %>% add_col_groups(col_groups, name = "My Groups")

# Print heatmap if interactive session 
if (interactive()) hm 



