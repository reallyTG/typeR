library(ganalytics)


### Name: And
### Title: And.
### Aliases: And `&` And,.compoundExpr-method
###   &,.compoundExpr,.compoundExpr-method

### ** Examples

purchased_on_mobile <- Expr(~deviceCategory == "mobile") & Expr(~transactions > 0)




