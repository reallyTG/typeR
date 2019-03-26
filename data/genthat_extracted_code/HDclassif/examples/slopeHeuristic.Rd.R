library(HDclassif)


### Name: slopeHeuristic
### Title: Slope Heuristic for HDDC objects
### Aliases: slopeHeuristic

### ** Examples

# Clustering of the Crabs data set
data(Crabs)
prms = hddc(Crabs[,-1], K = 1:10) # we estimate ten models
slope = slopeHeuristic(prms, plot = TRUE)
plot(slope$allCriteria) # The best model is indeed for 4 clusters
prms$all_results[[slope$best_model_index]] # we extract the best model





