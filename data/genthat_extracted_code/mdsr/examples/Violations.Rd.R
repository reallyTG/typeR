library(mdsr)


### Name: Violations
### Title: NYC Restaurant Health Violations
### Aliases: Violations ViolationCodes Cuisines
### Keywords: datasets

### ** Examples

data(Violations)
Violations %>%
  inner_join(Cuisines, by = "cuisine_code") %>%
  filter(cuisine_description == "American") %>%
  arrange(grade_date) %>%
  head() 



