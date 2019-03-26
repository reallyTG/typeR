library(seplyr)


### Name: add_group_sub_indices
### Title: Group a data frame and add in-group indices as a column.
### Aliases: add_group_sub_indices

### ** Examples



groupingVars = c("cyl", "gear")

datasets::mtcars %.>%
  # dplyr doesn't currently export tibble::rownames_to_column()
  mutate_se(., "CarName" := "rownames(.)" ) %.>%
  select_se(., c('CarName', 'cyl', 'gear', 'hp', 'wt')) %.>%
  add_group_indices(., groupingVars = groupingVars,
                    indexColumn = 'groupID') %.>%
  add_group_sub_indices(., groupingVars = groupingVars,
                       arrangeTerms = c('desc(hp)', 'wt'),
                       orderColumn = 'orderInGroup') %.>%
  arrange_se(., c('groupID', 'orderInGroup'))





