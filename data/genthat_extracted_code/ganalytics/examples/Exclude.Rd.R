library(ganalytics)


### Name: Exclude
### Title: Exclude
### Aliases: Exclude Exclude,ANY-method

### ** Examples

exclude_one_time_shoppers <- Exclude(
  Expr(~transactions == 1, metricScope = "perUser"),
  scope = "users"
)




