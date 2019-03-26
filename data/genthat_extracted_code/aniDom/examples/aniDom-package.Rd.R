library(aniDom)


### Name: aniDom-package
### Title: Inferring Dominance Hierarchies and Estimating Uncertainty
### Aliases: aniDom-package aniDom

### ** Examples


# Generate data
data <- generate_interactions(N.inds=10,N.obs=20,a=5,b=3)

# Extract interactions
winners <- data$interactions$Winner
losers <- data$interactions$Loser

# Calculate Elo scores with randomised order
scores <- elo_scores(winners=winners,losers=losers,randomise=TRUE,n.rands=1000)

# Plot ranks
plot_ranks(scores,plot.CIs=TRUE)

# Plot hierachy shape
plot_hierarchy_shape(identity=1:nrow(scores),rank=1:nrow(scores),
	winners=winners,losers=losers,fitted=TRUE)




