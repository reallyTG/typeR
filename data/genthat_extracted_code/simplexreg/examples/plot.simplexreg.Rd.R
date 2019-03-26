library(simplexreg)


### Name: plot.simplexreg
### Title: Plots for simplexreg Objects
### Aliases: plot.simplexreg

### ** Examples

## fit the model
data("sdac", package="simplexreg")
sim.glm2 <- simplexreg(rcd~ageadj+chemo|age, 
  link = "logit", data = sdac)
	
data("retinal", package = "simplexreg")
sim.gee2 <- simplexreg(Gas~LogT+LogT2+Level|LogT+Level|Time, 
  link = "logit", corr = "AR1", id = ID, data = retinal)  

## produce the plots
plot(sim.glm2, type = "residuals", res = "stdPerr", ylim = c(-3, 3))
plot(sim.gee2, type = "corr", xlab = "", ylab = "")
plot(sim.gee2, type = "GOF", xlab = "", ylab = "")



