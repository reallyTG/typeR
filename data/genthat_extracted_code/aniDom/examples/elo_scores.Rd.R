library(aniDom)


### Name: elo_scores
### Title: Calculate Elo scores (with or without time randomisations)
### Aliases: elo_scores

### ** Examples

	
	# Generate some input data
	data <- generate_interactions(10,20,5,2)
	
	# Extract winners and losers
	winners <- data$interactions$Winner
	losers <- data$interactions$Loser
	
	# Calculate Elo scores
	scores <- elo_scores(winners,losers)
	
	# Plot ranks
	plot_ranks(scores)
	



