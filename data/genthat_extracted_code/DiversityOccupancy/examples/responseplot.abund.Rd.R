library(DiversityOccupancy)


### Name: responseplot.abund
### Title: plot the response of an abundance model to the change of
###   aparticular variable
### Aliases: responseplot.abund

### ** Examples

## Not run: 
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
##D #plot the response of abundance to individual variables for species 4, 11
##D 
##D responseplot.abund(batch = BirdDiversity, spp = 4, variable = Elev)
##D 
##D responseplot.abund(batch = BirdDiversity, spp = 11, variable = Elev)
## End(Not run)



