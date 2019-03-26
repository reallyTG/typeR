library(tram)


### Name: Lehmann
### Title: Linear Regression for Lehrmann-alternatives
### Aliases: Lehmann
### Keywords: models regression smooth

### ** Examples


  data("BostonHousing2", package = "mlbench")

  lm(cmedv ~ crim + zn + indus + chas + nox + rm + age + dis + 
             rad + tax + ptratio + b + lstat, data = BostonHousing2)

  Lehmann(cmedv ~ chas + crim + zn + indus + nox + 
                  rm + age + dis + rad + tax + ptratio + b + lstat, 
                  data = BostonHousing2)



