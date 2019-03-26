library(simplexreg)


### Name: summary.simplexreg
### Title: Extracting Information from Objects simplexreg
### Aliases: summary.simplexreg print.summary.simplexreg coef.simplexreg
###   vcov.simplexreg logLik.simplexreg nobs.simplexreg AIC.simplexreg
###   BIC.simplexreg

### ** Examples

## fit the model
data("sdac", package = "simplexreg")
sim.glm2 <- simplexreg(rcd~ageadj+chemo|age, link = "logit", 
  data = sdac)

data("retinal", package = "simplexreg")
sim.gee2 <- simplexreg(Gas~LogT+LogT2+Level|LogT+Level|Time,
  link = "logit", corr = "AR1", id = ID, data = retinal)  
  
## extract information
summary(sim.glm2, type = "appstdPerr")
coef(sim.glm2)
vcov(sim.glm2)
AIC(sim.glm2)
BIC(sim.glm2)

summary(sim.gee2, type = "stdscor")
coef(sim.gee2)
vcov(sim.glm2)



