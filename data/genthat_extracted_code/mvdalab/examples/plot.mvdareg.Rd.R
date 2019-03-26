library(mvdalab)


### Name: plot.mvdareg
### Title: General plotting function for 'mvdareg' and 'mvdapaca' objects.
### Aliases: plot.mvdareg

### ** Examples

data(Penta)
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
               ncomp = 2, validation = "loo")
plot(mod1, plottype = "scoresplot")
## Not run: 
##D plot(mod1, plottype = "loadingsplot2D")
##D plot(mod1, plottype = "T2", ncomp = 2, phase = 1, conf = c(.95, .99))
## End(Not run)



