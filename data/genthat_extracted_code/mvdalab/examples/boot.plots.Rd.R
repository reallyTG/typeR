library(mvdalab)


### Name: boot.plots
### Title: Plots of the Output of a Bootstrap Simulation for an 'mvdareg'
###   Object
### Aliases: boot.plots

### ** Examples

data(Penta)
## Number of bootstraps set to 300 to demonstrate flexibility
## Use a minimum of 1000 (default) for results that support bootstraping
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
               ncomp = 2, validation = "oob", boots = 300)
boot.plots(mod1, type = "coefs", parm = NULL)



