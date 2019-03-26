library(cancensus)


### Name: parent_census_vectors
### Title: List all parent variables from vector hierarchical based on a
###   (sub-)list of census variables returned by 'list_census_vectors' or
###   'search_census_vectors'.
### Aliases: parent_census_vectors

### ** Examples

library(dplyr, warn.conflicts = FALSE)

list_census_vectors("CA16") %>%
  filter(vector == "v_CA16_4092") %>%
  parent_census_vectors()



