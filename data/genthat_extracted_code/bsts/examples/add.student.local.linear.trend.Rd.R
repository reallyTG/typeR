library(bsts)


### Name: add.student.local.linear.trend
### Title: Robust local linear trend
### Aliases: AddStudentLocalLinearTrend
### Keywords: models

### ** Examples

  data(rsxfs)
  ss <- AddStudentLocalLinearTrend(list(), rsxfs)
  model <- bsts(rsxfs, state.specification = ss, niter = 500)
  pred <- predict(model, horizon = 12, burn = 100)
  plot(pred)



