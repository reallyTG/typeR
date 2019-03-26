library(CatPredi)


### Name: plot.catpredi
### Title: Plot the optimal cut points.
### Aliases: plot.catpredi

### ** Examples

  library(CatPredi)
  set.seed(127)
  #Simulate data
  n = 100
  #Predictor variable
  xh <- rnorm(n, mean = 0, sd = 1)
  xd <- rnorm(n, mean = 1.5, sd = 1)
  x <- c(xh, xd)
  #Response
  y <- c(rep(0,n), rep(1,n))
  # Data frame
  df <- data.frame(y = y, x = x)
  
  # Select optimal cut points using the AddFor algorithm
  res.addfor <- catpredi(formula = y ~ 1, cat.var = "x", cat.points = 3, 
  				data = df, method = "addfor", range = NULL, correct.AUC = FALSE)
  # Plot
  plot(res.addfor)



