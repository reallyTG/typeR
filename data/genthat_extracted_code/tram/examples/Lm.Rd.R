library(tram)


### Name: Lm
### Title: Normal Linear Model
### Aliases: Lm
### Keywords: models regression

### ** Examples


  data("BostonHousing2", package = "mlbench")

  lm(cmedv ~ crim + zn + indus + chas + nox + rm + age + dis + 
             rad + tax + ptratio + b + lstat, data = BostonHousing2)

  Lm(cmedv ~ chas + crim + zn + indus + nox + 
             rm + age + dis + rad + tax + ptratio + b + lstat, 
             data = BostonHousing2)



