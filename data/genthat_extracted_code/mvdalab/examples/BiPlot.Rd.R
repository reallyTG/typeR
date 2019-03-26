library(mvdalab)


### Name: BiPlot
### Title: Generates a biplot from the output of an 'mvdareg' and 'mvdapca'
###   object
### Aliases: BiPlot

### ** Examples

data(Penta)
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
               ncomp = 2, validation = "loo")
BiPlot(mod1, diag.adj = c(0, 0), axis.scaling = 2, cov.scale = FALSE)

## Not run: 
##D data(Penta)
##D mod2 <- pcaFit(Penta[, -1], ncomp = 4)
##D BiPlot(mod2, diag.adj = c(0, 0), axis.scaling = 2.25, cov.scale = FALSE)
## End(Not run)



