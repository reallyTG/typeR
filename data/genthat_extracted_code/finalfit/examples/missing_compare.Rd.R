library(finalfit)


### Name: missing_compare
### Title: Compare missing data
### Aliases: missing_compare

### ** Examples

library(finalfit)

explanatory = c("age", "age.factor", "extent.factor", "perfor.factor")
dependent = "mort_5yr"

colon_s %>%
  ff_glimpse(dependent, explanatory)

colon_s %>%
 missing_pattern(dependent, explanatory)

colon_s %>%
  missing_compare(dependent, explanatory)



