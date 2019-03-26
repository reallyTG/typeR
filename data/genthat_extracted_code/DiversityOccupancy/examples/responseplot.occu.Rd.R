library(DiversityOccupancy)


### Name: responseplot.occu
### Title: plot the response of an occupancy model to the change of
###   aparticular variable
### Aliases: responseplot.occu

### ** Examples

## Not run: 
##D data("IslandBirds")
##D data("Daily_Cov")
##D data("siteCov")
##D BirdOccupancy <-batchoccu(pres = IslandBirds, sitecov = siteCov, obscov =
##D Daily_Cov, spp = 5, form = ~ Day + Wind + Rime + Noise + Clouds ~
##D Elev + AgroFo + SecVec + Wetland)
##D #plot the response of occupancy to individual variables for species 4 and 5
##D 
##D responseplot.occu(batch = BirdOccupancy, spp = 4, variable = Elev)
##D 
##D 
##D responseplot.occu(batch = BirdOccupancy, spp = 5, variable = Elev)
## End(Not run)



