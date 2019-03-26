library(Rlda)


### Name: rlda.bernoulliMH
### Title: LDA with bernoulli entry with Metropolis-Hasting.
### Aliases: rlda.bernoulliMH
### Keywords: LDA Mixed-Membership Cluster Bernoulli

### ** Examples

	## Not run: 
##D 		library(Rlda)
##D 		# Presence
##D 		data(presence)
##D 		# Set seed
##D 		set.seed(9842)
##D 		# Hyperparameters for each prior distribution
##D 		gamma <- 0.01
##D 		alpha0 <- 0.01
##D 		alpha1 <- 0.01
##D 		# Execute the LDA for the Bernoulli entry
##D 		res <- rlda.bernoulliMH(data=presence,loc.id=seq(1,nrow(presence)),
##D 		n_community=5, alpha0=0.01, alpha1=0.99, gamma=0.1,
##D     n_gibbs=1000, nadapt=1000, ll_prior = TRUE, display_progress = TRUE)
##D  	
## End(Not run)



