library(MixedPsy)


### Name: PsychDelta
### Title: PSE/JND for univariable GLM Using Delta Method
### Aliases: PsychDelta
### Keywords: DeltaMethod GLM Univariable

### ** Examples

#load simulated data
data(simul_data)
#fit a glm (probit link)
model.glm = glm(formula = cbind(Longer, Total - Longer) ~ X,
family = binomial(link = "probit"), data = simul_data)
PsychDelta(model.glm)




