library(BIEN)


### Name: BIEN_ranges_genus
### Title: Download range maps for given genus.
### Aliases: BIEN_ranges_genus

### ** Examples

## Not run: 
##D library(rgdal)
##D library(maps)
##D genus_vector<-c("Abies","Acer")
##D temp_dir <- file.path(tempdir(), "BIEN_temp")#Set a working directory
##D BIEN_ranges_genus(genus_vector)
##D BIEN_ranges_genus(genus_vector,match_names_only = TRUE)
##D BIEN_ranges_genus(genus_vector,temp_dir)#saves ranges to a specified working directory
##D BIEN_ranges_genus("Abies")
##D BIEN_ranges_genus("Abies",temp_dir)
##D 
##D #Reading files
##D 
##D Abies_poly<-readOGR(dsn = temp_dir,layer = "Abies_lasiocarpa")
##D 
##D #Plotting files
##D plot(Abies_poly)#plots the range, but doesn't mean much without any reference
##D map('world', fill = TRUE, col = "grey")#plots a world map (WGS84 projection), in grey
##D plot(Abies_poly,col="forest green",add=TRUE) #adds the range of Abies lasiocarpa to the map
##D 
##D #Getting data from the files (currently only species names)
##D Abies_poly$Species#gives the species name associated with "Abies_poly"
## End(Not run)



