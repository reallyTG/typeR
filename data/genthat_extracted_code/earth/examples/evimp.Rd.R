library(earth)


### Name: evimp
### Title: Estimate variable importances in an earth object
### Aliases: evimp
### Keywords: models

### ** Examples

data(ozone1)
earth.mod <- earth(O3 ~ ., data=ozone1, degree=2)
ev <- evimp(earth.mod, trim=FALSE)
plot(ev)
print(ev)



