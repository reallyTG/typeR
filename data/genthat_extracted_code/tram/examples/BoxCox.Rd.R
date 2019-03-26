library(tram)


### Name: BoxCox
### Title: (Similar to) Box-Cox Models
### Aliases: BoxCox
### Keywords: models regression smooth

### ** Examples


  data("BostonHousing2", package = "mlbench")

  lm(cmedv ~ crim + zn + indus + chas + nox + rm + age + dis + 
             rad + tax + ptratio + b + lstat, data = BostonHousing2)

  BoxCox(cmedv ~ chas + crim + zn + indus + nox + 
                 rm + age + dis + rad + tax + ptratio + b + lstat, 
                 data = BostonHousing2)



