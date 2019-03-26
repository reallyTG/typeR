library(ganalytics)


### Name: Expr
### Title: Expr
### Aliases: Expr Expr,.expr,ANY-method Expr,formula,ANY-method
###   Expr,character,character-method

### ** Examples

source_google <- Expr(~source == "google")
source_google <- Expr("source", "==", "google")
bounces <- Expr("bounces", ">", 0)



