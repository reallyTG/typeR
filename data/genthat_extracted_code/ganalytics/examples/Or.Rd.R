library(ganalytics)


### Name: Or
### Title: Or.
### Aliases: Or `|` Or,.compoundExpr-method
###   |,.compoundExpr,.compoundExpr-method

### ** Examples

mobile_or_tablet <- Expr(~deviceCategory == "mobile") | Expr(~deviceCategory == "tablet")
converted <- Expr(~goalCompletionsAll > 0) | Expr(~transactions > 0)




