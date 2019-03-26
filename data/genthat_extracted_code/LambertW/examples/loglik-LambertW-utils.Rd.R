library(LambertW)


### Name: loglik-LambertW-utils
### Title: Log-Likelihood for Lambert W\times F RVs
### Aliases: loglik-LambertW-utils loglik_LambertW loglik_input
###   loglik_penalty
### Keywords: distribution univar

### ** Examples

set.seed(1)
yy <- rLambertW(n = 1000, distname = "normal", 
                theta = list(beta = c(0, 1), delta = 0.2))
loglik_penalty(tau = theta2tau(list(beta = c(1, 1), delta = c(0.2, 0.2)),
                               distname = "normal"), 
               y = yy, type = "hh")
# For a type = 's' Lambert W x F distribution with location family input
# such a decomposition doesn't exist; thus NA.
loglik_penalty(tau = theta2tau(list(beta = c(1, 1), gamma = 0.03), 
                               distname = "normal"),
               is.non.negative = FALSE,
               y = yy, type = "s") 
# For scale-family input it does exist
loglik_penalty(tau = theta2tau(list(beta = 1, gamma = 0.01), 
                               distname = "exp"),
               is.non.negative = TRUE,
               y = yy, type = "s") 
               
# evaluating the Gaussian log-likelihood
loglik_input(beta = c(0, 1), x = yy, distname = "normal") # built-in version
# or pass your own log pdf function
loglik_input(beta = c(0, 1), x = yy, distname = "user", 
             log.dX = function(xx, beta = beta) { 
                dnorm(xx, mean = beta[1], sd = beta[2], log = TRUE)
             })
## Not run: 
##D # you must specify distname = 'user'; otherwise it does not work
##D loglik_input(beta = c(0, 1), x = yy, distname = "mydist", 
##D              log.dX = function(xx, beta = beta) { 
##D                 dnorm(xx, mean = beta[1], sd = beta[2], log = TRUE)
##D                 })
## End(Not run)

### loglik_LambertW returns all three values
loglik_LambertW(theta = list(beta = c(1, 1), delta = c(0.09, 0.07)), 
                y = yy, type = "hh", distname ="normal")

# can also take a flattend vector; must provide names though for delta
loglik_LambertW(theta = flatten_theta(list(beta = c(1, 1), 
                                          delta = c(delta_l = 0.09, 
                                                    delta_r = 0.07))), 
                y = yy, type = "hh", distname ="normal")




