library(mvdalab)


### Name: plot.smc
### Title: Plotting function for Significant Multivariate Correlation
### Aliases: plot.smc

### ** Examples

data(Penta)
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1], 
               ncomp = 2, validation = "loo")
smc(mod1)
plot(smc(mod1))



