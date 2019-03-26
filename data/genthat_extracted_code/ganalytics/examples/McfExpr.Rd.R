library(ganalytics)


### Name: McfExpr
### Title: McfExpr.
### Aliases: McfExpr McfExpr,character,character-method

### ** Examples

myQuery <- McfQuery(view = 123456789)
source_matches_google <- McfExpr("mcf:source", "~", "google")
TableFilter(myQuery) <- source_matches_google




