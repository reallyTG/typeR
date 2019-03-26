library(ganalytics)


### Name: Not
### Title: Not.
### Aliases: Not `!` Not,.comparator-method !,.comparator-method
###   Not,.expr-method !,.expr-method Not,orExpr-method !,orExpr-method
###   Not,.gaSegmentFilter-method !,.gaSegmentFilter-method

### ** Examples

source_matches_google <- Expr(~source %matches% "google")
source_not_matching_google <- Not(source_matches_google)
identical(source_not_matching_google, !source_matches_google)




