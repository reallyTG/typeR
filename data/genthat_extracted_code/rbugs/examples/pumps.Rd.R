library(rbugs)


### Name: pumps
### Title: 10 Power Plant Pumps
### Aliases: pumps
### Keywords: datasets

### ** Examples

data(pumps)
pumps.data <- list(t = pumps$t, x = pumps$x, N = nrow(pumps))
pumps.model <- system.file("bugs/model/pumps.bug", package="rbugs")
file.show(pumps.model)
pumps.inits <- system.file("bugs/inits/pumps.txt", package="rbugs") 
file.show(pumps.inits)
inits <- list(dget(pumps.inits))
parameters <- c("theta", "alpha", "beta")

## Not run: 
##D pumps.sim <- rbugs(data = pumps.data, inits, parameters, 
##D                    pumps.model, n.chains = 1, n.iter = 1000,
##D                    workingDir="~/tmp/",
##D                    useWine=TRUE)
##D 
##D ## MCMC Analysis
##D library("coda")
##D pumps.mcmc <- rbugs2coda(pumps.sim)
##D summary(pumps.mcmc)
##D effectiveSize(pumps.mcmc)
##D 
## End(Not run)



