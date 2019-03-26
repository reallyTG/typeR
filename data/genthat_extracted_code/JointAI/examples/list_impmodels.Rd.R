library(JointAI)


### Name: list_impmodels
### Title: List imputation models
### Aliases: list_impmodels

### ** Examples

# (set n.adapt = 0 and n.iter = 0 to prevent MCMC sampling to save computational time)
mod1 <- lm_imp(y ~ C1 + C2 + M2 + O2 + B2, data = wideDF, n.adapt = 0, n.iter = 0)

list_impmodels(mod1)





