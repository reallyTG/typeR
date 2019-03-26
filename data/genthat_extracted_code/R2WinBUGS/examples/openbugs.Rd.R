library(R2WinBUGS)


### Name: openbugs
### Title: Wrapper to run OpenBUGS
### Aliases: openbugs
### Keywords: interface models

### ** Examples

# An example model file is given in:
model.file <- system.file(package = "R2WinBUGS", "model", "schools.txt")
# Let's take a look:
file.show(model.file)

# Some example data (see ?schools for details):
data(schools)
schools

J <- nrow(schools)
y <- schools$estimate
sigma.y <- schools$sd
data <- list ("J", "y", "sigma.y")
inits <- function(){
    list(theta = rnorm(J, 0, 100), mu.theta = rnorm(1, 0, 100),
         sigma.theta = runif(1, 0, 100))
}
## or alternatively something like:
# inits <- list(
#   list(theta = rnorm(J, 0, 90), mu.theta = rnorm(1, 0, 90),
#        sigma.theta = runif(1, 0, 90)),
#   list(theta = rnorm(J, 0, 100), mu.theta = rnorm(1, 0, 100),
#        sigma.theta = runif(1, 0, 100))
#   list(theta = rnorm(J, 0, 110), mu.theta = rnorm(1, 0, 110),
#        sigma.theta = runif(1, 0, 110)))

parameters <- c("theta", "mu.theta", "sigma.theta")

## Not run: 
##D ## both write access in the working directory and package BRugs required:
##D schools.sim <- bugs(data, inits, parameters, model.file,
##D     n.chains = 3, n.iter = 5000,
##D     program = "openbugs", working.directory = NULL)
##D print(schools.sim)
##D plot(schools.sim)
## End(Not run)



