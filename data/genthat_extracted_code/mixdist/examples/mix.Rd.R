library(mixdist)


### Name: mix
### Title: Estimate Parameters of Mixture Distributions
### Aliases: mix
### Keywords: models

### ** Examples

data(pike65)
data(pikepar)
fitpike1 <- mix(pike65, pikepar, "lnorm", constr = mixconstr(consigma = "CCV"), emsteps = 3)
fitpike1
plot(fitpike1)
data(pike65sg)
fitpike2 <- mix(pike65sg, pikepar, "lnorm", emsteps = 3, usecondit = TRUE)
fitpike2
plot(fitpike2)
data(bindat)
data(binpar)
fitbin1 <- mix(bindat, binpar, "binom",
               constr = mixconstr(consigma = "BINOM", size = c(20, 20, 20, 20)))
plot(fitbin1)
fitbin2 <- mix(bindat, binpar, "binom", constr = mixconstr(conpi = "PFX",
               fixpi = c(TRUE, TRUE, TRUE, TRUE),
               consigma = "BINOM", size = c(20, 20, 20, 20)))
plot(fitbin2)



