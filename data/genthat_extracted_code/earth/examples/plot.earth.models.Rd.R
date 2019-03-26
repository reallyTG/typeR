library(earth)


### Name: plot.earth.models
### Title: Compare earth models by plotting them.
### Aliases: plot.earth.models
### Keywords: models

### ** Examples

data(ozone1)
a1 <- earth(O3 ~ .,          data = ozone1, degree = 2)
a2 <- earth(O3 ~ .-wind,     data = ozone1, degree = 2)
a3 <- earth(O3 ~ .-humidity, data = ozone1, degree = 2)
plot.earth.models(list(a1,a2,a3), ylim=c(.65,.85))



