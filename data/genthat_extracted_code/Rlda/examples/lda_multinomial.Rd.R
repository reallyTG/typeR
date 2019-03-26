library(Rlda)


### Name: rlda.multinomial
### Title: LDA with multinomial entry and Stick-Breaking prior.
### Aliases: rlda.multinomial
### Keywords: LDA Mixed-Membership Cluster Multinomial

### ** Examples

	## Not run: 
##D 		# Invoke the library
##D 		library(Rlda)
##D 		# Read the Complaints data
##D 		data(complaints)
##D 
##D 		# Create the abundance matrix
##D 		library(reshape2)
##D 		mat1 <- dcast(complaints[, c("Company","Issue")],
##D 					Company ~ Issue, fun.aggregate = length,
##D 					value.var = "Issue")
##D 		# Create the rowname
##D 		rownames(mat1) <- mat1[, 1]
##D 		# Remove the ID variable
##D 		mat1 <- mat1[, -1]
##D 
##D 		# Set seed
##D 		set.seed(9292)
##D 		# Hyperparameters for each prior distribution
##D 		beta <- rep(1,ncol(mat1))
##D 		gamma <- 0.01
##D 
##D 		#Execute the LDA for the Multinomial entry
##D 		res <- rlda.multinomial(data = mat1, n_community = 30,
##D 		beta = beta, gamma = gamma, n_gibbs = 1000,
##D 		ll_prior = TRUE, display_progress = TRUE)
##D 	
## End(Not run)



