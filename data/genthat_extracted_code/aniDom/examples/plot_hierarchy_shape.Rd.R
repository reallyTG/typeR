library(aniDom)


### Name: plot_hierarchy_shape
### Title: Plots the shape of a dominance hierarchy from empirical data
### Aliases: plot_hierarchy_shape

### ** Examples


	par(mfrow=c(1,2))

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
	shape <- plot_hierarchy_shape(identities,ranks,winners,losers,fitted=TRUE)

	# Data is contained in shape
	shape




