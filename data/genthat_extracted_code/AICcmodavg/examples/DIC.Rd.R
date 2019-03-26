library(AICcmodavg)


### Name: DIC
### Title: Computing DIC
### Aliases: DIC DIC.default DIC.bugs DIC.rjags
### Keywords: models

### ** Examples

##from ?jags example in R2jags package
## Not run: 
##D require(R2jags)
##D ##example model file
##D model.file <- system.file(package="R2jags", "model", "schools.txt")
##D file.show(model.file)     
##D 
##D ##data
##D J <- 8.0
##D y <- c(28.4,7.9,-2.8,6.8,-0.6,0.6,18.0,12.2)
##D sd <- c(14.9,10.2,16.3,11.0,9.4,11.4,10.4,17.6)
##D      
##D ##arrange data in list     
##D jags.data <- list (J = J, y = y, sd = sd)
##D 
##D ##initial values
##D jags.inits <- function(){
##D   list(theta=rnorm(J, 0, 100), mu=rnorm(1, 0, 100),
##D        sigma=runif(1, 0, 100))
##D }
##D 
##D ##parameters to be monitored
##D jags.parameters <- c("theta", "mu", "sigma")
##D      
##D ##run model
##D schools.sim <- jags(data = jags.data, inits = jags.inits,
##D                     parameters = jags.parameters,
##D                     model.file = model.file,
##D                     n.chains = 3, n.iter = 10)
##D ##note that n.iter should be higher
##D 
##D ##extract DIC
##D DIC(schools.sim)
##D ##extract pD
##D DIC(schools.sim, return.pD = TRUE)
##D detach(package:R2jags)
## End(Not run)



