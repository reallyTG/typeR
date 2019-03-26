library(spatstat)


### Name: predict.mppm
### Title: Prediction for Fitted Multiple Point Process Model
### Aliases: predict.mppm
### Keywords: spatial models

### ** Examples

  h <- hyperframe(Bugs=waterstriders)
  fit <- mppm(Bugs ~ x, data=h, interaction=Strauss(7))
  # prediction on a grid
  p <- predict(fit)
  plot(p$trend)
  # prediction at specified locations
  loc <- with(h, runifpoint(20, Window(Bugs)))
  p2 <- predict(fit, locations=loc)
  plot(p2$trend)



