library(JointAI)


### Name: parameters
### Title: Parameter names of an JointAI object
### Aliases: parameters

### ** Examples

# (does not need MCMC samples to work, so we will set n.adapt = 0 and
# n.iter = 0 to reduce computational time)
mod1 <- lm_imp(y ~ C1 + C2 + M2 + O2 + B2, data = wideDF, n.adapt = 0, n.iter = 0)

parameters(mod1)




