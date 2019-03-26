library(BIEN)


### Name: BIEN_ranges_load_species
### Title: Load range maps for specified species.
### Aliases: BIEN_ranges_load_species

### ** Examples

## Not run: 
##D library(maps)
##D species_vector<-c("Abies_lasiocarpa","Abies_amabilis")
##D abies_maps<-BIEN_ranges_load_species(species = species_vector)
##D xanthium_strumarium<-BIEN_ranges_load_species(species = "Xanthium strumarium")
##D 
##D #Plotting files
##D plot(abies_maps)#plots the spatialpolygons, but doesn't mean much without any reference
##D map('world', fill = TRUE, col = "grey")#plots a world map (WGS84 projection), in grey
##D plot(xanthium_strumarium,col="forest green",add=TRUE) #adds the range of X. strumarium
##D plot(abies_maps[1,], add = T, col ="light green")
## End(Not run)



