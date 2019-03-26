library(Rlda)


### Name: rlda.binomialVB
### Title: LDA with binomial entry and Stick-Breaking prior and Variational
###   Inference.
### Aliases: rlda.binomialVB
### Keywords: LDA Mixed-Membership Cluster Binomial Variational Inference

### ** Examples

	## Not run: 
##D 		library(Rlda)
##D 		# Set seed
##D 		set.seed(5874)
##D 		# Hyperparameters for each prior distribution
##D 		gamma  <- 0.01
##D 		alpha0 <- 0.01
##D 		alpha1 <- 0.01
##D 		# Execute the LDA for the Binomial entry
##D 		res<- rlda.binomialVB(data=tmp, loc.id='loc.id', n_community=10,
##D 		alpha0=0.01, alpha1=0.99, gamma=0.1, maxit=100, thresh=0.0001)
##D 	
## End(Not run)



