library(ecoengine)


### Name: ee_observations
### Title: Observations List
### Aliases: ee_observations

### ** Examples

# vulpes <- ee_observations(genus = "vulpes")
## Not run: 
##D # pinus <- ee_observations(scientific_name = "Pinus", page_size = 100)
##D # lynx_data <- ee_observations(genus = "Lynx")
##D # Georeferenced data only
##D # lynx_data <- ee_observations(genus = "Lynx", georeferenced = TRUE)
##D # animalia <- ee_observations(kingdom = "Animalia")
##D # Artemisia <- ee_observations(scientific_name = "Artemisia douglasiana")
##D # asteraceae <- ee_observationss(family = "asteraceae")
##D # vulpes <- ee_observations(genus = "vulpes")
##D # Anas <- ee_observations(scientific_name = "Anas cyanoptera", page = "all")
##D # loons <- ee_observations(scientific_name = "Gavia immer", page = "all")
##D # plantae <- ee_observations(kingdom = "plantae")
##D # chordata <- ee_observations(phylum = "chordata")
##D # Class is clss since the former is a reserved keyword in SQL.
##D # aves <- ee_observations(clss = "aves")
##D # You can also exclude fields using the exclude field
##D #  aves <- ee_observations(clss = "aves", exclude = "remote_resource")
##D #  aves <- ee_observations(clss = "aves", exclude = "source,remote_resource")
##D #  or request additional fields using extra
##D #  aves <- ee_observations(clss = "aves", extra = "kingdom,genus")
##D # aves <- ee_observations(clss = "aves", bbox = '-124,32,-114,42')
##D # aves <- ee_observations(clss = "aves", county = "Alameda county")
## End(Not run)



