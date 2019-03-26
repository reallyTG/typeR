library(ganalytics)


### Name: GaExpr
### Title: GaExpr.
### Aliases: GaExpr GaExpr,character,character-method

### ** Examples

myQuery <- GaQuery(view = 123456789)
source_matches_google <- GaExpr("source", "~", "google")
TableFilter(myQuery) <- source_matches_google



