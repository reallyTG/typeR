library(naniar)


### Name: impute_below_if
### Title: Scoped variants of 'impute_below'
### Aliases: impute_below_if

### ** Examples


airquality %>%
  impute_below_if(.predicate = is.numeric)




