library(simplexreg)


### Name: simplexreg
### Title: Simplex Generalized Linear Model Regression Function
### Aliases: simplexreg print.simplexreg simplexreg.fit
### Keywords: simplex regression

### ** Examples

# GLM models
data("sdac", package = "simplexreg")
sim.glm1 <- simplexreg(rcd~ageadj+chemo, link = "logit", 
  data = sdac)
sim.glm2 <- simplexreg(rcd~ageadj+chemo|age, link = "logit", 
  data = sdac)

# GEE models
data("retinal", package = "simplexreg")
sim.gee1 <- simplexreg(Gas~LogT+LogT2+Level|1|Time, link = "logit", 
  corr = "Exc", id = ID, data = retinal)
sim.gee2 <- simplexreg(Gas~LogT+LogT2+Level|LogT+Level|Time, 
  link = "logit", corr = "AR1", id = ID, data = retinal)	



