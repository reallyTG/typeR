library(finalfit)


### Name: ff_glimpse
### Title: Descriptive statistics for dataframe
### Aliases: ff_glimpse finalfit_glimpse

### ** Examples

library(finalfit)
dependent = 'mort_5yr'
explanatory = c("age", "nodes", "age.factor", "extent.factor", "perfor.factor")
colon_s %>%
  finalfit_glimpse(dependent, explanatory)



