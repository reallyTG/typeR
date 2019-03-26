library(ganalytics)


### Name: ScopeLevel
### Title: ScopeLevel
### Aliases: ScopeLevel ScopeLevel<- ScopeLevel,gaSegMetExpr,missing-method
###   ScopeLevel,gaSegMetExpr,character-method
###   ScopeLevel<-,gaMetExpr,character-method
###   ScopeLevel,.gaSegmentFilter,missing-method
###   ScopeLevel,.gaSegmentFilter,character-method
###   ScopeLevel<-,.gaSegmentFilter,character-method
###   ScopeLevel<-,gaDynSegment,character-method

### ** Examples

sessions_with_value <- Expr(~eventValue > 0, metricScope = "perSession")
ScopeLevel(sessions_with_value)
users_with_value_sessions <- Include(sessions_with_value)
ScopeLevel(users_with_value_sessions) <- "users"
sessions_with_value_segment <- ScopeLevel(users_with_value_sessions, "sessions")




