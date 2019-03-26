library(CatPredi)


### Name: comp.cutpoints
### Title: Selection of optimal number of cut points
### Aliases: comp.cutpoints

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
## Don't show: 
   
  # Select 2 optimal cut points using the AddFor algorithm. Correct the AUC
  res.addfor.k2 <- catpredi(formula = y ~ 1, cat.var = "x", cat.points = 2, 
  data = df, method = "addfor", range=NULL, correct.AUC=TRUE, 
  control=controlcatpredi(addfor.g=20))
  # Select 3 optimal cut points using the AddFor algorithm. Correct the AUC
  res.addfor.k3 <- catpredi(formula = y ~ 1, cat.var = "x", cat.points = 3, 
  data = df, method = "addfor", range=NULL, correct.AUC=TRUE, 
  control=controlcatpredi(addfor.g=20))
  comp <-  comp.cutpoints(res.addfor.k2, res.addfor.k3, V = 10)
## End(Don't show)
## No test: 
 
  # Select 2 optimal cut points using the AddFor algorithm. Correct the AUC
  res.addfor.k2 <- catpredi(formula = y ~ 1, cat.var = "x", cat.points = 2, 
  data = df, method = "addfor", range=NULL, correct.AUC=TRUE, 
  control=controlcatpredi(addfor.g=100))
  # Select 3 optimal cut points using the AddFor algorithm. Correct the AUC
  res.addfor.k3 <- catpredi(formula = y ~ 1, cat.var = "x", cat.points = 3, 
  data = df, method = "addfor", range=NULL, correct.AUC=TRUE, 
  control=controlcatpredi(addfor.g=100))     
  # Select optimal number of cut points
  comp <-  comp.cutpoints(res.addfor.k2, res.addfor.k3, V = 100)
## End(No test)


