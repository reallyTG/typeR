library(earth)


### Name: plot.evimp
### Title: Plot an evimp object (created by the evimp function)
### Aliases: plot.evimp
### Keywords: models

### ** Examples

data(ozone1)
earth.mod <- earth(O3 ~ ., data=ozone1, degree=2)
ev <- evimp(earth.mod)
plot(ev)
print(ev)



