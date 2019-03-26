library(simplexreg)


### Name: residuals.simplexreg
### Title: Extract residuals for simplexreg Objects
### Aliases: residuals.simplexreg

### ** Examples

## fit the model
data("sdac", package="simplexreg")
sim.glm2 <- simplexreg(rcd~ageadj+chemo|age,
  link = "logit", data = sdac)
	
data("retinal", package = "simplexreg")
sim.gee2 <- simplexreg(Gas~LogT+LogT2+Level|LogT+Level|Time,
  link = "logit", corr = "AR1", id = ID, data = retinal)  

## extract the residuals
res <- residuals(sim.glm2, type = "stdPerr")
res <- residuals(sim.gee2, type = "adjvar")



