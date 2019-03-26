library(tram)


### Name: Colr
### Title: Continuous Outcome Logistic Regression
### Aliases: Colr
### Keywords: models regression smooth

### ** Examples


  data("BostonHousing2", package = "mlbench")

  lm(cmedv ~ crim + zn + indus + chas + nox + rm + age + dis + 
             rad + tax + ptratio + b + lstat, data = BostonHousing2)

  Colr(cmedv ~ chas + crim + zn + indus + nox + 
               rm + age + dis + rad + tax + ptratio + b + lstat, 
               data = BostonHousing2)



