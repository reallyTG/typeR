library(mixdir)


### Name: predict.mixdir
### Title: Predict the class of a new observation.
### Aliases: predict.mixdir

### ** Examples

  data("mushroom")
  X <- as.matrix(mushroom)[1:30, ]

  res <- mixdir(X)

  # Predict Class
  predict(res, mushroom[40:45, ])
  predict(res, c(`gill-color`="black"))



