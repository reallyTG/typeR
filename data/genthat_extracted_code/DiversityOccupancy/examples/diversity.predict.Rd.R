library(DiversityOccupancy)


### Name: diversity.predict
### Title: Makes a spacially explicit prediction of the occupancy of
###   multiple species and alpha diversity, and select the area where
### Aliases: diversity.predict

### ** Examples

## Not run: 
##D #Load the data
##D data("IslandBirds")
##D data("Daily_Cov")
##D data("siteCov")
##D data("Birdstack")
##D 
##D #Model the abundance for  5 bat species and calculate alpha diversity from that
##D 
##D #Model the abundance for  5 bat species and calculate alpha diversity from that
##D 
##D BirdDiversity <-diversityoccu(pres = IslandBirds, sitecov = siteCov,
##D obscov = Daily_Cov,spp =  5, form = ~ Day + Wind + Time ~ Elev + Wetland + Upland)
##D 
##D #Select the best model that explains diversity using genetic algorithms
##D set.seed(123)
##D glm.Birdiversity <- model.diversity(BirdDiversity, method = "g")
##D 
##D # get the area where the first two bird species are most abundant
##D # and the diversity is high
##D 
##D library(rgdal)
##D Selected.area <- diversity.predict(model = BirdDiversity, diverse = glm.Birdiversity,
##D new.data = Birdstack, quantile.nth = 0.65, species =
##D c(TRUE, TRUE, FALSE, FALSE, FALSE))
##D 
##D Selected.area
## End(Not run)



