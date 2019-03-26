library(DiversityOccupancy)


### Name: batchoccu
### Title: Fits occupancy models for multiple species detection history
### Aliases: batchoccu

### ** Examples

## Not run: 
##D data("IslandBirds")
##D data("Daily_Cov")
##D data("siteCov")
##D BirdOccupancy <-batchoccu(pres = IslandBirds, sitecov = siteCov, obscov =
##D Daily_Cov, spp =  5, form = ~ Day + Wind + Rain + Noise + Clouds ~
##D Elev + AgroFo + SecVec + Wetland)
##D #plot the response of occupancy to individual variables for species 4 and  5
##D 
##D responseplot.occu(batch = BirdOccupancy, spp = 4, variable = Elev)
##D 
##D responseplot.occu(batch = BirdOccupancy, spp =  5, variable = Elev)
## End(Not run)
#Dredge for all species
BirdOccupancy2 <- batchoccu(pres = IslandBirds, sitecov = siteCov, obscov =
Daily_Cov, spp = 5, form = ~ 1 ~
Elev + AgroFo, dredge = TRUE)



