library(homals)


### Name: predict.homals
### Title: Classification tables for homals solutions
### Aliases: predict.homals print.predict.homals summary.predict.homals
### Keywords: models

### ** Examples

  data(galo)
  res <- homals(galo, active=c(TRUE, TRUE,TRUE, TRUE, FALSE))
  pr.res <- predict(res)
  pr.res
  summary(pr.res)



