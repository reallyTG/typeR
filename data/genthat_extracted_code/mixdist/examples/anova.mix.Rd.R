library(mixdist)


### Name: anova.mix
### Title: ANOVA Tables for Mixture Model Objects
### Aliases: anova.mix
### Keywords: models

### ** Examples

data(pike65) # load the grouped data `pike65'
data(pikepar) # load the initial values of parameters for the data `pike65'
fitpike3 <- mix(pike65, pikepar, "lnorm", mixconstr(conmu = "MFX", 
                fixmu = c(FALSE, FALSE, FALSE, FALSE, TRUE), consigma = "CCV"), emstep = 3)
anova(fitpike3)
fitpike4 <- mix(pike65, pikepar, "lnorm", mixconstr(consigma = "CCV"), emsteps = 3)
anova(fitpike4)
anova(fitpike3, fitpike4)
anova(fitpike4, fitpike3)



