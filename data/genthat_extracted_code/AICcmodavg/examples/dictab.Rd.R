library(AICcmodavg)


### Name: dictab
### Title: Create Model Selection Tables from Bayesian Analyses
### Aliases: dictab dictab.default dictab.AICbugs dictab.AICrjags
###   print.dictab
### Keywords: models

### ** Examples

##from ?jags example in R2jags package
## Not run: 
##D require(R2jags)
##D model.file <- system.file(package="R2jags", "model", "schools.txt")
##D file.show(model.file)     
##D 
##D ##data
##D J <- 8.0
##D y <- c(28.4,7.9,-2.8,6.8,-0.6,0.6,18.0,12.2)
##D sd <- c(14.9,10.2,16.3,11.0,9.4,11.4,10.4,17.6)
##D      
##D      
##D jags.data <- list (J = J, y = y, sd = sd)
##D jags.inits <- function(){
##D   list(theta=rnorm(J, 0, 100), mu=rnorm(1, 0, 100),
##D        sigma=runif(1, 0, 100))
##D }
##D jags.parameters <- c("theta", "mu", "sigma")
##D      
##D ##run model
##D schools.sim <- jags(data = jags.data, inits = jags.inits,
##D                     parameters = jags.parameters,
##D                     model.file = model.file,
##D                     n.chains = 3, n.iter = 10)
##D #note that n.iter should be higher
##D 
##D ##set up in list
##D Cand.mods <- list(schools.sim)
##D Model.names <- "hierarchical model"
##D ##other models can be added to Cand.mods
##D ##to compare them to the top model
##D 
##D ##model selection table
##D dictab(cand.set = Cand.mods, modnames = Model.names)
##D detach(package:R2jags)
## End(Not run)



