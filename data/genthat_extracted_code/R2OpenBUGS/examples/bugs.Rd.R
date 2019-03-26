library(R2OpenBUGS)


### Name: bugs
### Title: Run OpenBUGS from R
### Aliases: bugs
### Keywords: interface models

### ** Examples


## Not run: 
##D # An example model file is given in:
##D model.file <- system.file(package="R2OpenBUGS", "model", "schools.txt")
##D # Let's take a look:
##D #file.show(model.file)
##D 
##D # Some example data (see ?schools for details):
##D data(schools)
##D schools
##D 
##D J <- nrow(schools)
##D y <- schools$estimate
##D sigma.y <- schools$sd
##D data <- list ("J", "y", "sigma.y")
##D inits <- function(){
##D     list(theta=rnorm(J, 0, 100), mu.theta=rnorm(1, 0, 100),
##D          sigma.theta=runif(1, 0, 100))
##D }
##D ## or alternatively something like:
##D # inits <- list(
##D #   list(theta=rnorm(J, 0, 90), mu.theta=rnorm(1, 0, 90),
##D #        sigma.theta=runif(1, 0, 90)),
##D #   list(theta=rnorm(J, 0, 100), mu.theta=rnorm(1, 0, 100),
##D #        sigma.theta=runif(1, 0, 100))
##D #   list(theta=rnorm(J, 0, 110), mu.theta=rnorm(1, 0, 110),
##D #        sigma.theta=runif(1, 0, 110)))
##D 
##D parameters <- c("theta", "mu.theta", "sigma.theta")
##D 
##D ## You may need to specify "OpenBUGS.pgm"
##D ## also you need write access in the working directory:
##D schools.sim <- bugs(data, inits, parameters, model.file,
##D     n.chains=3, n.iter=5000)
##D print(schools.sim)
##D plot(schools.sim)
## End(Not run)



