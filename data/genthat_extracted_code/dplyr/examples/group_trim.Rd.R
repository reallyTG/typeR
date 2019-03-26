library(dplyr)


### Name: group_trim
### Title: Trim grouping structure
### Aliases: group_trim

### ** Examples

iris %>%
  group_by(Species) %>%
  filter(Species == "setosa", .preserve = TRUE) %>%
  group_trim()




