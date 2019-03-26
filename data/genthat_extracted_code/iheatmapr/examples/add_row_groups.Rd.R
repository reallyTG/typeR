library(iheatmapr)


### Name: add_row_groups
### Title: add_row_groups
### Aliases: add_row_groups add_row_groups,Iheatmap-method

### ** Examples


mat <- matrix(rnorm(20), ncol = 5, nrow = 4)
row_groups <- c("A","A","B","D")
hm <- iheatmap(mat) %>% add_row_groups(row_groups, name = "My Groups")

# Print heatmap if interactive session 
if (interactive()) hm 



