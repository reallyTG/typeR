library(DiversityOccupancy)


### Name: diversityoccu
### Title: Calculates alpha diversity from multiple species occupancy data
### Aliases: diversityoccu

### ** Examples

## Not run: 
##D #Load the data
##D data("IslandBirds")
##D data("Daily_Cov")
##D data("siteCov")
##D 
##D #Model the abundance for  5 bird species and calculate alpha diversity from that
##D 
##D BirdDiversity <-diversityoccu(pres = IslandBirds, sitecov = siteCov,
##D obscov = Daily_Cov,spp =  5, form = ~ Day + Wind + Time + Rain +
##D Noise ~ Elev + AgroFo + SecVec + Wetland + Upland)
##D 
##D #To see the estimates and p values for each model:
##D 
##D BirdDiversity$models
## End(Not run)



