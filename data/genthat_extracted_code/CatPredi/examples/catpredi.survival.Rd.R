library(CatPredi)


### Name: catpredi.survival
### Title: Function to obtain optimal cut points to categorise a continuous
###   predictor variable in a Cox proportional hazards regression model
### Aliases: catpredi.survival

### ** Examples

library(CatPredi)
library(survival)
set.seed(123)
#Simulate data
  n = 500
  tauc = 1
  X <- rnorm(n=n, mean=0, sd=2)
  SurvT <- exp(2*X + rweibull(n = n, shape=1, scale = 1))   + rnorm(n, mean=0, sd=0.25)
  # Censoring time
  CensTime <- runif(n=n, min=0, max=tauc)
  # Status
  SurvS <- as.numeric(SurvT <= CensTime)
  # Data frame
  dat <- data.frame(X = X, SurvT = pmin(SurvT, CensTime), SurvS = SurvS)
  
  # Select optimal cut points using the AddFor algorithm
  res <- catpredi.survival (formula= Surv(SurvT,SurvS)~1, cat.var="X", cat.points = 2,
   data = dat, method = "addfor", conc.index = "cindex", range = NULL, 
   correct.index = FALSE) 




