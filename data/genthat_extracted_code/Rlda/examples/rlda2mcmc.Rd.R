library(Rlda)


### Name: rlda2mcmc
### Title: Conversion between rlda to mcmc object from coda package
### Aliases: rlda2mcmc rlda2mcmc.rlda
### Keywords: rlda2mcmc LDA Fuzzy Cluster

### ** Examples

## Not run: 
##D #Load data
##D data(presence)
##D #Set seed
##D set.seed(9842)
##D #Hyperparameters for each prior distribution
##D gamma <-0.01
##D alpha0<-0.01
##D alpha1<-0.01
##D #Execute the LDA for the Binomial entry
##D res<-rlda.bernoulli(presence, 10, alpha0, alpha1, gamma,
##D                     5000, TRUE, FALSE)
##D #rlda2mcmc the results
##D listParams <- rlda2mcmc(res)
## End(Not run)



