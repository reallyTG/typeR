library(ganalytics)


### Name: Sequence
### Title: Sequence.
### Aliases: Sequence Later,.compoundExpr-method Then,.compoundExpr-method
###   First,.compoundExpr-method Sequence,ANY-method

### ** Examples

expr1 <- Expr(~pagepath == "/")
expr2 <- Expr(~eventCategory == "video")
expr3 <- Expr(~timeOnPage > 10)
expr4 <- Expr(~transactionRevenue > 10)
expr5 <- expr1 & expr2
expr6 <- Expr(~eventAction == "click")
expr7 <- Expr(~eventCategory == "video") & Expr(~eventAction == "play")
expr8 <- Expr(~source == "google")
Segment(
  PerUser(
    expr1, # treat an expression as 'condition type segment filter' by default
    PerHit(
      expr3
    )
  ),
  Sequence(
    expr2,
    Then(expr4), # 'then' means 'immediately followed by'
    Later(expr5) # 'later' means 'followed by', but not necessarily immediately.
  ),
  Sequence(
    First(expr6), # First expressly means 'first interaction' within the date range.
    Then(expr7), # By default, treat an expression within a sequence as happening
    expr8 # at any point after any preceding steps in the sequence, i.e. 'later'.
  )
)




