library(rbugs)


### Name: schools
### Title: 8 schools
### Aliases: schools
### Keywords: datasets

### ** Examples

data(schools)
J <- nrow(schools)
y <- schools$estimate
y <- rnorm(length(y))
sigma.y <- schools$sd
schools.data <- list ("J", "y", "sigma.y") 
## schools.data <- list(J=J, y=y, sigma.y=sigma.y)
inits <- function() {list (theta=rnorm(J,0,100),
                           mu.theta=rnorm(1,0,100),
                           sigma.theta=runif(1,0,100))}
parameters <- c("theta", "mu.theta", "sigma.theta")
schools.bug <- system.file("bugs/model/schools.bug", package="rbugs")
file.show(schools.bug)

## Not run: 
##D ## no tested examples for mac-os.
##D 
##D schools.sim <- rbugs(data=schools.data, inits, parameters,
##D                      schools.bug, n.chains=3, n.iter=1000,
##D                      bugs="/usr/bin/OpenBUGS",
##D                      bugsWorkingDir="~/tmp/")
##D                     
##D ## generate files only
##D schools.sim <- rbugs(data=schools.data, inits, parameters,
##D                      schools.bug, n.chains=3, n.iter=1000,
##D                      bugsWorkingDir="~/tmp/",
##D                      OpenBugs=TRUE, genFilesOnly=TRUE)
##D 
##D ## MCMC analysis
##D library("coda")
##D schools.mcmc <- rbugs2coda(schools.sim)
##D summary(schools.mcmc)
##D effectiveSize(schools.mcmc)
##D gelman.diag(schools.mcmc)
##D 
##D 
## End(Not run)



