library(KFAS)


### Name: is.SSModel
### Title: Test whether object is a valid 'SSModel' object
### Aliases: is.SSModel

### ** Examples

model <- SSModel(rnorm(10) ~ 1)
is.SSModel(model)
model['H'] <- 1
is.SSModel(model)
model$H[] <- 1
is.SSModel(model)
model$H[,,1] <- 1
is.SSModel(model)
model$H <- 1
is.SSModel(model)



