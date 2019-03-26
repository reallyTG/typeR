library(ganalytics)


### Name: RtExpr
### Title: RtExpr.
### Aliases: RtExpr RtExpr,character,character-method

### ** Examples

myQuery <- RtQuery(view = 123456789)
source_matches_google <- RtExpr("rt:source", "~", "google")
TableFilter(myQuery) <- source_matches_google




