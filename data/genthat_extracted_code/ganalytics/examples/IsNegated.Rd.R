library(ganalytics)


### Name: IsNegated
### Title: IsNegated
### Aliases: IsNegated IsNegated<- IsNegated,.gaSegmentFilter-method
###   IsNegated<-,.gaSegmentFilter,logical-method

### ** Examples

exclude_one_time_shoppers <- Exclude(
  Expr(~transactions == 1, metricScope = "perUser"),
  scope = "users"
)
IsNegated(exclude_one_time_shoppers) # TRUE




