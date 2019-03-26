library(seplyr)


### Name: group_by_se
### Title: group_by standard interface.
### Aliases: group_by_se

### ** Examples



datasets::mtcars %.>%
  group_by_se(., c("cyl", "gear")) %.>%
  head(.)




