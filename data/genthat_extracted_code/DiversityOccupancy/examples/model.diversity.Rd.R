library(DiversityOccupancy)


### Name: model.diversity
### Title: Find the best GLM model explaining the alpha divesity of the
###   species
### Aliases: model.diversity

### ** Examples

## Not run: 
##D #Load the data
##D data("IslandBirds")
##D data("Daily_Cov")
##D data("siteCov")
##D 
##D #Model the abundance for  5 bat species and calculate alpha diversity from that
##D 
##D BirdDiversity <-diversityoccu(pres = IslandBirds, sitecov = siteCov,
##D obscov = Daily_Cov,spp =  5, form = ~ Day + Wind + Time + Rain +
##D Noise ~ Elev + AgroFo + SecVec + Wetland + Upland)
##D 
##D #Select the best model that explains diversity using genetic algorithms
##D set.seed(123)
##D glm.Birdiversity <- model.diversity(BirdDiversity, method = "g")
##D 
##D #see the best models
##D 
##D glm.Birdiversity$Best.model
##D 
##D #plot the response of diversity to individual variables
##D 
##D plot(glm.Birdiversity, elev)
##D 
##D #To add the quadratic components of models
##D 
##D glm.birdiversity <- model.diversity(BirdDiversity , method = "g", squared = TRUE)
##D 
##D responseplot.diver(glm.birdiversity, Elev)
## End(Not run)



