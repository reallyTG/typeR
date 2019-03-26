library(e1071)


### Name: plot.tune
### Title: Plot Tuning Object
### Aliases: plot.tune
### Keywords: models

### ** Examples

  data(iris)
  obj <- tune.svm(Species~., data = iris, sampling = "fix",
                  gamma = 2^c(-8,-4,0,4), cost = 2^c(-8,-4,-2,0))
  plot(obj, transform.x = log2, transform.y = log2)
  plot(obj, type = "perspective", theta = 120, phi = 45)



