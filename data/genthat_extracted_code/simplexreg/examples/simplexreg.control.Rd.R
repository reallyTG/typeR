library(simplexreg)


### Name: simplexreg.control
### Title: Control Parameters for Simplex Regression
### Aliases: simplexreg.control

### ** Examples

# GLM models
data("sdac", package = "simplexreg")
sim.glm1 <- simplexreg(rcd~ageadj+chemo, link = "logit", 
  data = sdac, beta = c(1.115, 0.013, 0.252))
sim.glm2 <- simplexreg(rcd~ageadj+chemo|age, link = "logit", 
  data = sdac, beta = c(1.115, 0.013, 0.252), gamma = c(2.61, -0.015))

# GEE models
data("retinal", package = "simplexreg")
sim.gee1 <- simplexreg(Gas~LogT+LogT2+Level|1|Time, link = "logit", 
  corr = "Exc", id = ID, data = retinal, beta = c(2.72, 0.034, -0.329, 0.409), 
  alpha = -0.3)
sim.gee2 <- simplexreg(Gas~LogT+LogT2+Level|LogT+Level|Time, 
  link = "logit", corr = "AR1", id = ID, data = retinal, alpha = -0.3,
  beta = c(2.72, 0.034, -0.329, 0.409))



