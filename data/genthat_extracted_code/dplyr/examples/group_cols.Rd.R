library(dplyr)


### Name: group_cols
### Title: Select grouping variables
### Aliases: group_cols

### ** Examples

gdf <- iris %>% group_by(Species)

# Select the grouping variables:
gdf %>% select(group_cols())

# Remove the grouping variables from mutate selections:
gdf %>% mutate_at(vars(-group_cols()), `/`, 100)



