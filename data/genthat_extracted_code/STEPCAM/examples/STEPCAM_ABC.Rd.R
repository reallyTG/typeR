library(STEPCAM)


### Name: STEPCAM_ABC
### Title: ABC-SMC inference of the STEPCAM model
### Aliases: STEPCAM_ABC
### Keywords: community assembly traits simulation processes functional
###   diversity

### ** Examples

## Not run: 
##D  
##D Artificial.Data <- generate.Artificial.Data(n_species = 40, n_traits = 3,
##D                         n_communities = 5, occurence_distribution = 0.2,
##D                         average_richness = 0.5, sd_richness = 0.2,
##D                         mechanism_random=FALSE)
##D O <- STEPCAM_ABC(Artificial.Data$abundances, Artificial.Data$traits,
##D                  numParticles = 10, n_traits = 3, plot_number = 1, stopRate = 0.8)
## End(Not run)



