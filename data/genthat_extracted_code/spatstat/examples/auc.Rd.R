library(spatstat)


### Name: auc
### Title: Area Under ROC Curve
### Aliases: auc auc.ppp auc.lpp auc.ppm auc.kppm auc.lppm
### Keywords: spatial

### ** Examples

  fit <- ppm(swedishpines ~ x+y)
  auc(fit)
  auc(swedishpines, "x")



