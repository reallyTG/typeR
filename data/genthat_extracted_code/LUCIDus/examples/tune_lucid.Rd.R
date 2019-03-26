library(LUCIDus)


### Name: tune_lucid
### Title: Parallel Grid Search for Tuning Parameters in Latent Cluster
###   Analysis
### Aliases: tune_lucid
### Keywords: Grid-search Parameter, Tuning

### ** Examples

# For a testing dataset with 10 genetic features (5 causal) and 4 biomarkers (2 causal)
# Parallel grid-search with 8 combinations of tuning parameters
## Not run: 
##D GridSearch <- tune_lucid(G=G1, Z=Z1, Y=Y1, K=2, Family="binary", USEY = TRUE, NoCores = 2,
##D                          LRho_g = 0.008, URho_g = 0.012, NoRho_g = 2,
##D                          LRho_z_invcov = 0.04, URho_z_invcov = 0.06, NoRho_z_invcov = 2,
##D                          LRho_z_covmu = 90, URho_z_covmu = 100, NoRho_z_covmu = 2)
##D GridSearch$Results
##D # Determine the best tuning parameters
##D GridSearch$Optimal
## End(Not run)



