library(traitdataform)


### Name: standardize.exploratories
### Title: Standardize Georeference from Biodiversity Exploratories Plot ID
### Aliases: standardize.exploratories

### ** Examples


## Not run: 
##D moths <- read.service(21247, dec = ",")
##D 
##D dataset1 <- as.traitdata(moths, taxa = "species", traits = c(body_mass =
##D     "weight", wing_length = "wing_length", wing_width = "wing_width", wing_area =
##D     "wing_area", wing_loading = "wing_loading"),
##D   keep = c(locationID = "plot"))
##D 
##D dataset1Std <- standardize.exploratories(dataset1)
## End(Not run)



