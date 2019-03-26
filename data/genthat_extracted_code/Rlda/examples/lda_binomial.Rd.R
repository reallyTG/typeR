library(Rlda)


### Name: rlda.binomial
### Title: LDA with binomial entry and Stick-Breaking prior.
### Aliases: rlda.binomial
### Keywords: LDA Mixed-Membership Cluster Binomial

### ** Examples

	## Not run: 
##D 		library(Rlda)
##D 		# Read the SP500 data
##D 		data(sp500)
##D 		# Create size
##D 		spSize <- as.data.frame(matrix(100,
##D 							  ncol = ncol(sp500),
##D 							  nrow = nrow(sp500)))
##D 		# Set seed
##D 		set.seed(5874)
##D 		# Hyperparameters for each prior distribution
##D 		gamma  <- 0.01
##D 		alpha0 <- 0.01
##D 		alpha1 <- 0.01
##D 		# Execute the LDA for the Binomial entry
##D 		res <- rlda.binomial(data = sp500, pop = spSize, n_community = 10,
##D 		alpha0 = alpha0, alpha1 = alpha1, gamma = gamma,
##D 		n_gibbs = 500, ll_prior = TRUE, display_progress = TRUE)
##D 	
## End(Not run)



