library(mvdalab)


### Name: plot.sr
### Title: Plotting function for Selectivity Ratio.
### Aliases: plot.sr

### ** Examples

data(Penta)
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1], 
               ncomp = 2, validation = "loo")
sr(mod1)
plot(sr(mod1))



