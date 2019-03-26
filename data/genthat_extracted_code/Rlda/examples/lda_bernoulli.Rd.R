library(Rlda)


### Name: rlda.bernoulli
### Title: LDA with bernoulli entry and Stick-Breaking prior.
### Aliases: rlda.bernoulli
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
##D 		res <- rlda.bernoulli(data = presence, n_community = 10,
##D 		alpha0 = alpha0, alpha1 = alpha1, gamma = gamma,
##D 		n_gibbs = 5000,ll_prior = TRUE, display_progress = TRUE)
##D 	
## End(Not run)



