library(Taxonstand)


### Name: TPL
### Title: Standardize plant names according to The Plant List.
### Aliases: TPL
### Keywords: vegetation analysis

### ** Examples

## Not run: 
##D data(bryophytes)
##D 
##D # Species names in full
##D r1 <- TPL(bryophytes$Full.name[1:20], corr = TRUE)
##D str(r1)
##D 
##D # A separate specification for genera, specific, and infraspecific
##D # epithets
##D r2 <- TPL(genus = bryophytes$Genus, species = bryophytes$Species,
##D infrasp = bryophytes$Intraspecific, corr = TRUE)
##D str(r2)
##D 
##D #----------------------------------
##D # An example using data from GBIF
##D #----------------------------------
##D # Download all records available in GBIF of all species within genus
##D # Liriodendron (GBIF table; note that a list of species can be also
##D # downloaded from GBIF for a defined geographical area)
##D require(dismo)
##D liriodendron <- gbif("Liriodendron", "*", geo = TRUE)
##D 
##D # Perform taxonomic standardization on plant names (TPL table)
##D sp.check <- TPL(unique(liriodendron$scientificName), infra = TRUE, 
##D corr = TRUE)
##D head(sp.check)
##D 
##D # Join GBIF table with TPL table
##D require(dplyr)
##D liriodendron.check <- liriodendron %>%
##D left_join(., sp.check, by = c("scientificName" = "Taxon"))
##D 
## End(Not run)



