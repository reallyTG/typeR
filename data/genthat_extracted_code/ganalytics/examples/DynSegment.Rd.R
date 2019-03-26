library(ganalytics)


### Name: DynSegment
### Title: DynSegment
### Aliases: DynSegment DynSegment,ANY-method
###   DynSegment,gaDynSegment-method

### ** Examples

return_shoppers <- SegmentConditionFilter(
  Expr(~transactions > 1, metricScope = "perUser"),
  scope = "users"
)
watched_video_then_purchased <- Sequence(
  Expr(~eventCategory == "video") & Expr(~eventAction == "play"),
  Later(Expr(~transactions > 0))
)




