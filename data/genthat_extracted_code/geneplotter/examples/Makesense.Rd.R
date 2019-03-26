library(geneplotter)


### Name: Makesense
### Title: Produce Smoothed Sense/Anti-sense For All Chromosomes
### Aliases: Makesense Makesense,matrix,character-method
###   Makesense,ExpressionSet,missing-method
###   Makesense,ExpressionSet,character-method
### Keywords: dplot

### ** Examples

  if (require("hgu133a.db")) {
    data(expressionSet133a)
    esetobj <- Makesense(exprs(expressionSet133a), "hgu133a")
    esetobj2 <- Makesense(expressionSet133a[1:200, ])
  }



