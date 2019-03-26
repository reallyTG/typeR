library(DiversityOccupancy)


### Name: responseplot.diver
### Title: plot the response of the calculated alpha diversity to the
###   change of a particular variable
### Aliases: responseplot.diver

### ** Examples

## Not run: 
##D #Load the data
##D data("IslandBirds")
##D data("Daily_Cov")
##D data("siteCov")
##D 
##D #Model the abundance for 5 bird species and calculate alpha diversity from that
##D 
##D BirdDiversity <-diversityoccu(pres = IslandBirds, sitecov = siteCov,
##D obscov = Daily_Cov,spp = 5, form = ~ Day + Wind + Time + Rain +
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
## End(Not run)



