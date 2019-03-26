library(bayescount)


### Name: count.model
### Title: Analyse Count Data Using Jags
### Aliases: count.model fec.model FEC.model run.model
### Keywords: models

### ** Examples


#  Return the model specification and starting values for a 
# lognormal Poisson, then run the model using run.jags:

## Not run: 
##D data <- rpois(100, rlnorm(3, 0.2))
##D 
##D model <- run.model(model="LP", data=data, call.jags=FALSE)
##D library('runjags')
##D results <- extend.jags(model, burnin=5000, sample=10000)
##D 
## End(Not run)




