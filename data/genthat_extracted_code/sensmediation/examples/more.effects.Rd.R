library(sensmediation)


### Name: more.effects
### Title: Estimate additional natural direct and indirect effects based on
###   an object from 'sensmediation'
### Aliases: more.effects

### ** Examples

## Not run: 
##D #First we estimate marginal NIE, NDE with sensitivity analyses to mediator-outcome confounding:
##D effects.my <- sensmediation(med.model = m.model, out.model = y.model, exp.name = "z",
##D                      med.name = "m", Rho = seq(0, 0.5, 0.1))
##D 
##D #Then we want to do the same for conditional NIE, NDE without reestimating the regression
##D #coefficients:
##D effects.my.cond <- more.effects(sensmed.object = effects.my, covariates = list(x = 1))
##D summary(effects.my.cond)
##D plot(effects.my.cond)
## End(Not run)




