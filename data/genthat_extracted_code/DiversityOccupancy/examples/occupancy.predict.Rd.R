library(DiversityOccupancy)


### Name: occupancy.predict
### Title: Predicts occupancy for all the species in a batchoccupancy class
###   object
### Aliases: occupancy.predict

### ** Examples

## Not run: 
##D #Load the data
##D data("IslandBirds")
##D data("Daily_Cov")
##D data("siteCov")
##D data("Birdstack")
##D BirdOccupancy <-batchoccu(pres = IslandBirds, sitecov = siteCov, obscov =
##D Daily_Cov, spp =  5, form = ~ Day + Wind + Rime + Noise + Clouds ~
##D Elev + AgroFo + SecVec + Wetland)
##D 
##D Occupancy.stack <- occupancy.predict(batch = BirdOccupancy, new.data =
##D Birdstack)
## End(Not run)



