library(earth)


### Name: plot.earth
### Title: Plot an earth object
### Aliases: plot.earth earth_plotmodsel
### Keywords: models

### ** Examples

data(ozone1)
earth.mod <- earth(O3 ~ ., data = ozone1, degree = 2)
plot(earth.mod)



