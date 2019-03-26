library(ganalytics)


### Name: xor
### Title: Generate an expression that gives the EXCLUSIVE-OR of two
###   expressions.
### Aliases: xor xor,.compoundExpr,.compoundExpr-method

### ** Examples

either_enquired_or_downloaded <- xor(
  Expr(~eventCategory == "enquiry"),
  Expr(~eventCategory == "download")
)




