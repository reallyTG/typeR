library(spatstat)


### Name: roc
### Title: Receiver Operating Characteristic
### Aliases: roc roc.ppp roc.lpp roc.ppm roc.kppm roc.lppm
### Keywords: spatial

### ** Examples

  plot(roc(swedishpines, "x"))
  fit <- ppm(swedishpines ~ x+y)
  plot(roc(fit))



