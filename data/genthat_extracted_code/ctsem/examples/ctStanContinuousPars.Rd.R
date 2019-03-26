library(ctsem)


### Name: ctStanContinuousPars
### Title: ctStanContinuousPars
### Aliases: ctStanContinuousPars

### ** Examples

#posterior median over all subjects (also reflects mean of unconstrained pars)
ctStanContinuousPars(ctstantestfit)

#posterior 97.5% quantiles for subject 2
ctStanContinuousPars(ctstantestfit, subjects=2, calcfunc=quantile, 
calcfuncargs=list(probs=0.975))



