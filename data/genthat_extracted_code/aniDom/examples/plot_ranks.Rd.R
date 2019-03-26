library(aniDom)


### Name: plot_ranks
### Title: Plot the ranking of individuals
### Aliases: plot_ranks

### ** Examples

	
	# Set population size 
	N <- 10

	# Set shape parameters
	a = 15
	b = 3

	# Generate data
	data <- generate_interactions(N,100,a,b)

	# Extract data (and turn IDs into letters for this example)
	winners <- letters[data$interactions$Winner]
	losers <- letters[data$interactions$Loser]
	identities <- letters[data$hierarchy$ID]
	
	# Calculate Elo scores
	scores <- elo_scores(winners,losers,identities=identities,randomise=TRUE)
	
	# Plot results
	plot_ranks(scores, plot.CIs=TRUE,identities=TRUE,colors=rainbow(N))
	



