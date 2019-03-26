library(mvdalab)


### Name: sr
### Title: Selectivity Ratio
### Aliases: sr print.sr sr.error sr.modeled

### ** Examples

data(Penta)
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
               ncomp = 2, validation = "loo")
sr(mod1)
plot(sr(mod1))

## Not run: 
##D mod2 <- plsFit(Sepal.Length ~., scale = TRUE, data = iris,
##D                method = "wrtpls", validation = "none") #ncomp is ignored
##D plot(sr(mod2, ncomps = 2))
## End(Not run)



