library(simplexreg)


### Name: predict.simplexreg
### Title: Prediction Method for simplexreg Objects
### Aliases: predict.simplexreg

### ** Examples

## fit the model
data("sdac", package="simplexreg")
sim.glm2 <- simplexreg(rcd~ageadj+chemo|age, link = "logit", 
  data = sdac)

data("retinal", package = "simplexreg")
sim.gee2 <- simplexreg(Gas~LogT+LogT2+Level|LogT+Level|Time,
  link = "logit", corr = "AR1", id = ID, data = retinal)  	

## predict the mean
predict(sim.glm2, type = "response")

## predict the dispersion
predict(sim.gee2, type = "dispersion")



