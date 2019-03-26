library(BoomSpikeSlab)


### Name: logit.spike
### Title: Spike and slab logistic regression
### Aliases: logit.spike
### Keywords: models regression

### ** Examples

if (requireNamespace("MASS")) {
  data(Pima.tr, package = "MASS")
  data(Pima.te, package = "MASS")
  pima <- rbind(Pima.tr, Pima.te)
  model <- logit.spike(type == "Yes" ~ ., data = pima, niter = 500)
  plot(model)
  plot(model, "fit")
  plot(model, "residuals")
  plot(model, "size")
  summary(model)
}



