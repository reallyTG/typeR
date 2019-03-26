library(edarf)


### Name: plot_pd
### Title: Plot partial dependence from random forests
### Aliases: plot_pd

### ** Examples

library(randomForest)
library(edarf)
data(iris)
fit = randomForest(Species ~ ., iris)
pd = partial_dependence(fit, "Petal.Width", data = iris)
plot_pd(pd)



