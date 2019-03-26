library(CatPredi)


### Name: comp.cutpoints.survival
### Title: Selection of optimal number of cut points
### Aliases: comp.cutpoints.survival

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
  ## No test: 
  # Select 2 optimal cut points using the AddFor algorithm. Correct the c-index
  res.k2 <- catpredi.survival (formula= Surv(SurvT,SurvS)~1, cat.var="X", cat.points = 2, 
  data = dat, method = "addfor", conc.index = "cindex", range = NULL, correct.index = TRUE) 
  # Select 3 optimal cut points using the AddFor algorithm. Correct the c-index
  res.k3 <- catpredi.survival (formula= Surv(SurvT,SurvS)~1, cat.var="X", cat.points = 3, 
  data = dat, method = "addfor", conc.index = "cindex", range = NULL, correct.index = TRUE) 
    # Select optimal number of cut points
  comp <-  comp.cutpoints.survival(res.k2, res.k3, V = 100)
  
## End(No test)
  ## Don't show: 
  # Select 2 optimal cut points using the AddFor algorithm. Correct the c-index
  res.k2 <- catpredi.survival (formula= Surv(SurvT,SurvS)~1, cat.var="X", cat.points = 1, 
  data = dat, method = "addfor", conc.index = "cindex", range = NULL, correct.index = TRUE, 
  control=controlcatpredi.survival(addfor.g=20)) 
  # Select 3 optimal cut points using the AddFor algorithm. Correct the c-index
  res.k3 <- catpredi.survival (formula= Surv(SurvT,SurvS)~1, cat.var="X", cat.points = 2, 
  data = dat, method = "addfor", conc.index = "cindex", range = NULL, correct.index = TRUE, 
  control=controlcatpredi.survival(addfor.g=20)) 
  # Select optimal number of cut points
  comp <-  comp.cutpoints.survival(res.k2, res.k3, V = 3)
  
## End(Don't show)
    



