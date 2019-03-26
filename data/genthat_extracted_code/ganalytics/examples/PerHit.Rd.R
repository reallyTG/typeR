library(ganalytics)


### Name: PerHit
### Title: PerHit
### Aliases: PerHit PerHit,.compoundExpr-method PerHit,gaMetExpr-method
###   PerHit,formula-method

### ** Examples

spent_more_than_100_in_a_transaction <- PerHit(Expr(~transactionRevenue > 100))
played_intro_video <- PerHit(
  Expr(~eventCategory == "Video") &
  Expr(~eventAction == "Play") &
  Expr(~eventLabel == "Intro")
)




