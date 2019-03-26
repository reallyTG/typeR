library(mixdist)


### Name: plot.mix
### Title: Mix Object Plotting
### Aliases: plot.mix
### Keywords: dplot

### ** Examples

data(pike65)
data(pikepar)
fit1 <- mix(pike65, pikepar, "lnorm",
            constr = mixconstr(consigma = "CCV"), emsteps = 3)
plot(fit1)
plot(fit1, root = TRUE)
data(bindat)
data(binpar)
fit2 <- mix(bindat, binpar, "binom",
            constr = mixconstr(consigma = "BINOM", size = c(20, 20, 20, 20)))
plot(fit2)
plot(fit2, root = TRUE)



