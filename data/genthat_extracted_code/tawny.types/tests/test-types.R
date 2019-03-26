
get_portfolio <- function()
{
  idx <- as.Date("2011-01-01") + seq(1,20)
  rets <- xts(matrix(rnorm(80), ncol=4), idx)
  colnames(rets) <- c('A','B','C','D')
  TawnyPortfolio(rets, 15)
}

assert('test.window_at.portfolio', {
  p <- get_portfolio()
  #cat("\ndim(p$returns):",dim(p$returns),"\n")

  p1 <- window_at(p,1)
  (nrow(p1$returns) == 15)
  (all(p1$returns[1,] == p$returns[1,]))

  p2 <- window_at(p,2)
  (nrow(p2$returns) == 15)
  (all(p2$returns[1,] == p$returns[2,]))

  p3 <- window_at(p,3)
  (nrow(p3$returns) == 15)
  (all(p3$returns[1,] == p$returns[3,]))

  p4 <- window_at(p,4)
  (nrow(p4$returns) == 15)
  (all(p4$returns[1,] == p$returns[4,]))

  p5 <- window_at(p,5)
  (nrow(p5$returns) == 15)
  (all(p5$returns[1,] == p$returns[5,]))

  p6 <- window_at(p,6)
  (nrow(p6$returns) == 15)
  (all(p6$returns[1,] == p$returns[6,]))
})

assert('test.start.TawnyPortfolio', {
  p <- get_portfolio()
  row <- start(p)
  #cat("\nRow:",row,"\n")
  #cat("\nRow:",p$rets[5,],"\n")
  (all(row == p$rets[5,]))
})

assert('test.end.TawnyPortfolio', {
  p <- get_portfolio()
  row <- end(p)
  (all(row == p$rets[nrow(p$rets),]))
})

# TODO: Add test to verify rownames
assert('test.rollapply.TawnyPortfolio', {
  p <- get_portfolio()
  out <- rollapply(p, function(x) colSums(x$returns))
  #cat("\nout:\n")
  #print(out)
  (all(out[1,] == colSums(p$returns[1:15,] )))
  (all(out[2,] == colSums(p$returns[2:16,] )))
  (all(out[3,] == colSums(p$returns[3:17,] )))
  (all(out[4,] == colSums(p$returns[4:18,] )))
  (all(out[5,] == colSums(p$returns[5:19,] )))
  (all(out[6,] == colSums(p$returns[6:20,] )))
})
