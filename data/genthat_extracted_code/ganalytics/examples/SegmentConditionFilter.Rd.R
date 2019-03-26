library(ganalytics)


### Name: SegmentConditionFilter
### Title: SegmentConditionFilter
### Aliases: SegmentConditionFilter SegmentConditionFilter,ANY-method

### ** Examples

bounced_sessions <- SegmentConditionFilter(Expr(~bounces > 0))
return_shoppers <- SegmentConditionFilter(
  Expr(~transactions > 1, metricScope = "perUser"),
  scope = "users"
)




