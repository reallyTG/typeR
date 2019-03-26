library(CatPredi)


### Name: catpredi
### Title: Function to obtain optimal cut points to categorise a continuous
###   predictor variable in a logistic regression model
### Aliases: catpredi

### ** Examples

library(CatPredi)
## Don't show: 
set.seed(127)
#Simulate data
  n = 100
  #Predictor variable
  xh <- rnorm(n, mean = 0, sd = 1)
  xd <- rnorm(n, mean = 1.5, sd = 1)
  x <- c(xh, xd)
  #Response
  y <- c(rep(0,n), rep(1,n))
  #Covariate
  zh <- rnorm(n, mean=1.5, sd=1)
  zd <- rnorm(n, mean=1, sd=1)
  z <- c(zh, zd)
  # Data frame
  df <- data.frame(y = y, x = x, z = z)
  
  # Select optimal cut points using the AddFor algorithm
  res.addfor <- catpredi(formula = y ~ z, cat.var = "x", cat.points = 2, 
  data = df, method = "addfor", range=NULL, correct.AUC=FALSE, control=controlcatpredi(addfor.g=20))
## End(Don't show)
## No test: 
set.seed(127)
#Simulate data
  n = 200
  #Predictor variable
  xh <- rnorm(n, mean = 0, sd = 1)
  xd <- rnorm(n, mean = 1.5, sd = 1)
  x <- c(xh, xd)
  #Response
  y <- c(rep(0,n), rep(1,n))
  #Covariate
  zh <- rnorm(n, mean=1.5, sd=1)
  zd <- rnorm(n, mean=1, sd=1)
  z <- c(zh, zd)
  # Data frame
  df <- data.frame(y = y, x = x, z = z)
  
  # Select optimal cut points using the AddFor algorithm
  res.addfor <- catpredi(formula = y ~ z, cat.var = "x", cat.points = 3, 
  data = df, method = "addfor", range=NULL, correct.AUC=FALSE)
## End(No test) 


