library(mvdalab)


### Name: plot.wrtpls
### Title: Plots of the Output of a Permutation Distribution for an
###   'mvdareg' Object with 'method = "bidiagpls"'
### Aliases: plot.wrtpls

### ** Examples

data(Penta)
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
               method = "wrtpls", validation = "none")
plot.wrtpls(mod1, distribution = "log")



