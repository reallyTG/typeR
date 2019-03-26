library(dplyr)


### Name: groups
### Title: Return grouping variables
### Aliases: groups group_vars

### ** Examples

df <- tibble(x = 1, y = 2) %>% group_by(x, y)
group_vars(df)
groups(df)



