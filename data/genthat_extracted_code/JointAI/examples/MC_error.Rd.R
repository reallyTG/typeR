library(JointAI)


### Name: MC_error
### Title: Monte Carlo error
### Aliases: MC_error plot.MCElist

### ** Examples

mod <- lm_imp(y~C1 + C2 + M2, data = wideDF, n.iter = 100)

MC_error(mod)

plot(MC_error(mod), ablinepars = list(lty = 2))




