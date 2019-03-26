library(aniDom)


### Name: plot_trajectories
### Title: Plot the Elo trajectories of individuals
### Aliases: plot_trajectories

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
	scores <- elo_scores(winners,losers,identities=identities,
		randomise=FALSE,return.trajectories=TRUE)
	
	# Plot results
	plot_trajectories(scores, colors=rainbow(N))
	



