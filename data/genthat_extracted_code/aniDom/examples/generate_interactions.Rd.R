library(aniDom)


### Name: generate_interactions
### Title: Generate simulated interactions with differently-shaped
###   hierarchies
### Aliases: generate_interactions

### ** Examples

	
	par(mfrow=c(2,2))
	
	# Set population size 
	N <- 20
	
	# Set shape parameters
	a = 15
	b = 3
	
	# See what this looks like
	plot_winner_prob(1:N,a,b)
	
	# Generate some input data
	data <- generate_interactions(N,400,a,b)
	
	# See what the hierarchy looks like from the output data
	winners <- data$interactions$Winner
	losers <- data$interactions$Loser
	identities <- data$hierarchy$ID
	ranks <- data$hierarchy$Rank
	plot_hierarchy_shape(identities,ranks,winners,losers,fitted=TRUE)
	
	# Set new shape parameters
	a = 3
	b = 3
	
	# See what this looks like
	plot_winner_prob(1:N,a,b)
	
	# Generate some input data
	data <- generate_interactions(N,400,a,b)
	
	# See what the hierarchy looks like from the output data
	winners <- data$interactions$Winner
	losers <- data$interactions$Loser
	identities <- data$hierarchy$ID
	ranks <- data$hierarchy$Rank
	plot_hierarchy_shape(identities,ranks,winners,losers,fitted=TRUE)
	



