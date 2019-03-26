library(mvdalab)


### Name: smc
### Title: Significant Multivariate Correlation
### Aliases: smc print.smc smc.error smc.modeled

### ** Examples

data(Penta)
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
               ncomp = 2, validation = "loo")
smc(mod1)
plot(smc(mod1))

###  PLS MODEL FIT WITH method = 'wrtpls' and validation = 'none', i.e. WRT-PLS is performed ###
## Not run: 
##D mod2 <- plsFit(Sepal.Length ~., scale = TRUE, data = iris,
##D                method = "wrtpls", validation = "none") #ncomp is ignored
##D plot(smc(mod2, ncomps = 2))
## End(Not run)




