library(nlsr)


### Name: model2rjfun
### Title: Create functions to calculate the residual vector or the sum of
###   squares, possibly with derivatives.
### Aliases: model2rjfun model2ssgrfun modelexpr
### Keywords: nonlinear

### ** Examples


  y <- c(5.308, 7.24, 9.638, 12.866, 17.069, 23.192, 31.443, 38.558, 
      50.156, 62.948, 75.995, 91.972) 
      
  tt <- seq_along(y)  # for testing
  mydata <- data.frame(y = y, tt = tt)
  f <- y ~ b1/(1 + b2 * exp(-1 * b3 * tt))
  p <- c(b1 = 1, b2 = 1, b3 = 1)
  rjfn <- model2rjfun(f, p, data = mydata)
  rjfn(p)
  myexp <- modelexpr(rjfn)
  cat("myexp:")
  print(myexp)


  ssgrfn <- model2ssgrfun(f, p, data = mydata)
  ssgrfn(p)



