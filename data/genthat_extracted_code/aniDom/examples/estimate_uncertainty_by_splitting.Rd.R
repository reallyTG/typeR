library(aniDom)


### Name: estimate_uncertainty_by_splitting
### Title: Calculate the repeatability score of ranks by splitting the
###   observed data in half.
### Aliases: estimate_uncertainty_by_splitting

### ** Examples

	
	# Generate some input data
	data <- generate_interactions(10,20,5,2)
	
	# Extract winners and losers
	winners <- data$interactions$Winner
	losers <- data$interactions$Loser
	
	# Calculate repeatability
	r <- estimate_uncertainty_by_splitting(winners,losers,randomise=TRUE)
	



