library(PAWL)


### Name: target
### Title: Class: target distribution
### Aliases: target-class target target,ANY-method show,target-method
### Keywords: classes

### ** Examples

  showClass("target")
  # starting points for MCMC algorithms
  rinit <- function(size) rnorm(size)
  # target log density function: a gaussian distribution N(mean = 2, sd = 3)
  parameters <- list(mean = 2, sd = 3)
  logdensity <- function(x, parameters) dnorm(x, parameters$mean, parameters$sd, log = TRUE)
  # creating the target object
  gaussiantarget <- target(name = "gaussian", dimension = 1,
                    rinit = rinit, logdensity = logdensity,
                    parameters = parameters)
  print(gaussiantarget)



