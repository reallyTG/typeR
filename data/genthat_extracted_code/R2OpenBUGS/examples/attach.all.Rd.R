library(R2OpenBUGS)


### Name: attach.all
### Title: Attach / detach elements of (bugs) objects to search path
### Aliases: attach.all detach.all attach.bugs detach.bugs
### Keywords: data

### ** Examples

# An example model file is given in:
model.file <- system.file("model", "schools.txt", package="R2OpenBUGS")
# Some example data (see ?schools for details):
data(schools)
J <- nrow(schools)
y <- schools$estimate
sigma.y <- schools$sd
data <- list ("J", "y", "sigma.y")
inits <- function(){
    list(theta = rnorm(J, 0, 100), mu.theta = rnorm(1, 0, 100),
        sigma.theta = runif(1, 0, 100))
}
parameters <- c("theta", "mu.theta", "sigma.theta")
## Not run: 
##D ## See ?bugs if the following fails:
##D schools.sim <- bugs(data, inits, parameters, model.file,
##D     n.chains = 3, n.iter = 1000,
##D     working.directory = NULL)
##D 
##D # Do some inferential summaries
##D attach.bugs(schools.sim)
##D # posterior probability that the coaching program in school A
##D # is better than in school C:
##D print(mean(theta[,1] > theta[,3]))
##D # 50##D 
##D # and school C's program:
##D print(quantile(theta[,1] - theta[,3], c(.25, .75)))
##D plot(theta[,1], theta[,3])
##D detach.bugs()
## End(Not run)



