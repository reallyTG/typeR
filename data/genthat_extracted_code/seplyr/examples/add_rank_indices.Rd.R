library(seplyr)


### Name: add_rank_indices
### Title: Arrange a data frame and rank indexes.
### Aliases: add_rank_indices

### ** Examples



datasets::mtcars %.>%
  # tibble::rownames_to_column() not currently re-exported by dplyr
  mutate_se(., "CarName" := "rownames(.)" ) %.>%
  select_se(., c('CarName', 'hp', 'wt')) %.>%
  add_rank_indices(., arrangeTerms = c('desc(hp)', 'wt'),
                   orderColumn = 'rankID') %.>%
  arrange_se(., 'rankID')





