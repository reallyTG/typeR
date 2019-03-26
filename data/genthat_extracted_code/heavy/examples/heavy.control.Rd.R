library(heavy)


### Name: heavy.control
### Title: Set control parameters
### Aliases: heavy.control
### Keywords: models

### ** Examples

ctrl <- heavy.control(maxIter = 200, tol = 1e-04, ndraws = 9000)
data(dental)
heavyLme(distance ~ age * Sex, random = ~ age, groups = ~ Subject,
  data = dental, control = ctrl)



