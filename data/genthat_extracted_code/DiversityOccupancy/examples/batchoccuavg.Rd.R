library(DiversityOccupancy)


### Name: batchoccuavg
### Title: Fits occupancy models for multiple species detection history and
###   calculated model average
### Aliases: batchoccuavg

### ** Examples

## Not run: 
##D data("IslandBirds")
##D data("Daily_Cov")
##D data("siteCov")
##D BirdOccupancy <-batchoccuavg(pres = IslandBirds, sitecov = siteCov, obscov =
##D Daily_Cov, spp =  5, form = ~ Day + Wind + Rain + Noise + Clouds ~
##D Elev + AgroFo + SecVec + Wetland)
##D #Summary of averaged model for species 2
##D summary(BirdOccupancy$models[[2]])
## End(Not run)
#Dredge for all species



