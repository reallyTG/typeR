library(tidyLPA)


### Name: AHP
### Title: Select best model using analytic hyrarchy process
### Aliases: AHP

### ** Examples

iris[,1:4] %>%
  estimate_profiles(1:4) %>%
  get_fit() %>%
  AHP()



