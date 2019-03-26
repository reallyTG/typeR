library(aniDom)


### Name: estimate_uncertainty_by_repeatability
### Title: Calculate the repeatability score of ranks from randomisations
###   of the interaction orders.
### Aliases: estimate_uncertainty_by_repeatability

### ** Examples

	
	# Generate some input data
	data <- generate_interactions(10,20,5,2)
	
	# Extract winners and losers
	winners <- data$interactions$Winner
	losers <- data$interactions$Loser
	
	# Calculate repeatability
	r <- estimate_uncertainty_by_repeatability(winners,losers)
	



