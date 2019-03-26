library(SVMMaj)


### Name: print.q.svmmaj
### Title: SVM-Maj Algorithm
### Aliases: print.q.svmmaj svmmaj svmmaj.default

### ** Examples


## using default settings
model1 <- svmmaj(
 diabetes$X, diabetes$y, hinge = 'quadratic', lambda = 1)
summary(model1)

weights.obs = list(positive = 2, negative = 1)
## using radial basis kernel
library(kernlab)
model2 <- svmmaj(
  diabetes$X, diabetes$y, hinge = 'quadratic', lambda = 1, 
  weights.obs = weights.obs, scale = 'interval',
  kernel = rbfdot,
  kernel.sigma = 1
)
summary(model2)
## I-spline basis
library(ggplot2)
model3 <- svmmaj(
  diabetes$X, diabetes$y, weight.obs = weight.obs,
  spline.knots = 3, spline.degree = 2
)
plotWeights(model3, plotdim = c(2, 4))



