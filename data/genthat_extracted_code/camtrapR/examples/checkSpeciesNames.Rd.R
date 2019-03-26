library(camtrapR)


### Name: checkSpeciesNames
### Title: Check species names against the ITIS taxonomic database
### Aliases: checkSpeciesNames

### ** Examples


## Not run: 
##D 
##D 
##D species_common <- c("Leopard Cat", "moonrat")
##D 
##D # ask = TRUE. Multiple matches for leopard cat will cause menu to pop up asking user input.
##D 
##D species.names.check1 <- checkSpeciesNames(speciesNames = species_common,
##D                                           searchtype   = "common",
##D                                           accepted     = TRUE,
##D                                           ask          = TRUE)
##D 2   # we choose entry 2
##D species.names.check1
##D 
##D 
##D # ask = FALSE. Multiple matches for leopard cat will cause NA.
##D 
##D species.names.check2 <- checkSpeciesNames(speciesNames = species_common,
##D                                           searchtype   = "common",
##D                                           accepted     = TRUE,
##D                                           ask          = FALSE)
##D species.names.check2
##D 
##D 
##D 
##D # search for scientific names
##D 
##D species_scientific <- c("Tragulus", "Prionailurus bengalensis")
##D 
##D species.names.check3 <- checkSpeciesNames(speciesNames = species_scientific,
##D                                           searchtype   = "scientific",
##D                                           accepted     = TRUE,
##D                                           ask          = TRUE)
##D species.names.check3
## End(Not run)




