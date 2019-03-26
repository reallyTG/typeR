library(bayescount)


### Name: fecrt.model
### Title: Create an MCMC model to analyse FECRT Data
### Aliases: FECRT.model fecrt.model
### Keywords: models

### ** Examples

## Not run: 
##D # Data in an appropriate format:
##D data <- data.frame(Count=rpois(80,rep(c(10,10,2,2), 20)),
##D Subject=rep(1:20, each=4), Time=rep(rep(1:2,each=2),40),
##D Sample=1:2, Control=rep(c(0,1), each=40))
##D # Compile the model - a paired model is required because
##D # there are replicate samples within an individual:
##D model <- fecrt.model(data, paired.model=TRUE)
##D # Update the model - requires runjags:
##D library('runjags')
##D results <- extend.jags(model, burnin=5000)
## End(Not run)



