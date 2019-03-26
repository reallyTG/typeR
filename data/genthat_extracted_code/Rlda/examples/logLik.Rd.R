library(Rlda)


### Name: logLik
### Title: Provide the log-likelihood for the rlda object.
### Aliases: logLik logLik.rlda
### Keywords: summary LDA Fuzzy Cluster

### ** Examples

## Not run: 
##D 		library(Rlda)
##D 		#Load data
##D     data(presence)
##D     #Set seed
##D     set.seed(9842)
##D     #Hyperparameters for each prior distribution
##D     gamma <-0.01
##D     alpha0<-0.01
##D     alpha1<-0.01
##D     #Execute the LDA for the Binomial entry
##D     res<-rlda.bernoulli(presence, 10, alpha0, alpha1, gamma,
##D                         5000, TRUE, FALSE)
##D 		#log-likelihood
##D 		logLik(res)
##D   
## End(Not run)



