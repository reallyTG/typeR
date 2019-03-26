library(rAvis)


### Name: avisMapSpecies
### Title: Renders a map for each of the species provided in names
### Aliases: avisMapSpecies

### ** Examples

## Not run: 
##D 
##D avisMapSpecies("Bubo bubo", "phys")
##D 
##D # if interested in several species, you can explore the database using avisMapSpecies
##D avisMapSpecies (list("Tyto alba", "Athene noctua", "Bubo bubo", "Strix aluco"),
##D                maptype="phys")
##D 
##D # and you can save those maps individually using the tiff function
##D 
##D directory<- "C:/your_directory"
##D species<- list("Tyto alba", "Athene noctua", "Bubo bubo", "Strix aluco")
##D for (x in species){
##D  tiff (file.path (directory, paste ("/", x, ".tiff", sep="")))
##D  avisMapSpecies (x)
##D  dev.off()
##D }
##D 
## End(Not run)



